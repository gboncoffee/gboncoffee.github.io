package main

import (
	"bytes"
	_ "embed"
	"errors"
	"fmt"
	"net/http"
	"os"
	"path/filepath"
	"sort"
	"strings"
	"time"

	"github.com/yuin/goldmark"
	"github.com/yuin/goldmark/extension"
	"github.com/yuin/goldmark/renderer/html"
)

//go:embed embeded-root.html
var FORMAT string

type MDInfo struct {
	Title     string
	Timestamp time.Time
	Path      string
}

var Directories = make(map[string][]MDInfo)

func MakeIndex(dir string, list []MDInfo) {
	target := dir + "/index.html"
	content := "<ul>\n"

	sort.Slice(list, func(i, j int) bool {
		return list[i].Timestamp.After(list[j].Timestamp)
	})

	for _, md := range list {
		content = content + fmt.Sprintf(`
<li>
  <h2>
    <a href="/%s">%s</a>
  </h2>
  Written in %s.
`, md.Path, md.Title, md.Timestamp.Format(time.DateTime))
	}

	content = fmt.Sprintf(FORMAT, fmt.Sprintf("Index - %s", dir), content)
	if err := os.WriteFile(target, []byte(content), 0600); err != nil {
		fmt.Println(fmt.Errorf("warning: could not write to file %s: %v", target, err))
	}
}

func MakeIndexes() {
	for dir, list := range Directories {
		if dir != "." {
			MakeIndex(dir, list)
		}
	}
}

func GetTitleAndTimestamp(source string) (string, string) {
	newline := strings.IndexRune(source, '\n')
	source = source[:newline]
	var title string
	var timestamp string

	if len(source) > len("<!-- :: -->") {
		source = source[4:strings.Index(source, "-->")]
		splitted := strings.Split(source, "::")
		if len(splitted) == 2 {
			title = strings.TrimSpace(splitted[0])
			timestamp = strings.TrimSpace(splitted[1])
		}
	}

	return title, timestamp
}

var md = goldmark.New(
	goldmark.WithExtensions(extension.GFM),
	goldmark.WithRendererOptions(
		html.WithUnsafe(),
	),
)

func Build(path string) {
	source, err := os.ReadFile(path)
	if err != nil {
		fmt.Println(fmt.Errorf("warning: cannot build file %s: %v", path, err))
		return
	}

	title, timestamp := GetTitleAndTimestamp(string(source))

	var buffer bytes.Buffer
	if err := md.Convert([]byte(source), &buffer); err != nil {
		fmt.Println(fmt.Errorf("warning: error compiling file %s: %v", path, err))
		return
	}

	target := path[:strings.LastIndex(path, ".md")] + ".html"
	content := []byte(fmt.Sprintf(FORMAT, title, buffer.Bytes()))

	if err := os.WriteFile(target, content, 0600); err != nil {
		fmt.Println(fmt.Errorf("warning: could not write to file %s: %v", target, err))
	}

	time, err := time.Parse(time.DateTime, timestamp)
	if err != nil {
		fmt.Println(fmt.Errorf("warning: cannot parse date on file %s: %v", path, err))
	}

	dir := filepath.Dir(target)
	Directories[dir] = append(Directories[dir], MDInfo{
		Title:     title,
		Timestamp: time,
		Path:      target,
	})
}

func BuildWalker(path string, entry os.DirEntry, err error) error {
	if path != "." && strings.HasPrefix(filepath.Base(path), ".") {
		return filepath.SkipDir
	}

	if filepath.Ext(path) == ".md" {
		Build(path)
	}

	return nil
}

func WriteTemplate(target string, title string) {
	timestamp := time.Now().Format(time.DateTime)
	content := fmt.Sprintf("<!-- %s :: %s -->\n", title, timestamp)
	if err := os.WriteFile(target, []byte(content), 0600); err != nil {
		fmt.Println(fmt.Errorf("cannot write to file %s: %v", target, err))
		os.Exit(1)
	}
}

func main() {
	if len(os.Args) > 1 {
		if os.Args[1] == "serve" {
			fmt.Println("Serving on localhost:6969")
			http.ListenAndServe(":6969", http.FileServer(http.Dir(".")))
		} else if os.Args[1] == "new" {
			if len(os.Args) < 3 {
				fmt.Println(errors.New("no target passed to `new`"))
				os.Exit(1)
			}
			if len(os.Args) < 4 {
				fmt.Println(errors.New("no title passed to `new`"))
				os.Exit(1)
			}
			if strings.Index(os.Args[3], "::") != -1 {
				fmt.Println(errors.New("title must not have `::`"))
				os.Exit(1)
			}
			WriteTemplate(os.Args[2], os.Args[3])
		} else {
			fmt.Println(fmt.Errorf("unknown command %s", os.Args[1]))
			os.Exit(1)
		}

		os.Exit(0)
	}

	if err := filepath.WalkDir(".", BuildWalker); err != nil {
		panic(err)
	}

	MakeIndexes()
}
