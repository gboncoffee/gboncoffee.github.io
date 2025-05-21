package main

import (
	"bytes"
	_ "embed"
	"flag"
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

	content = fmt.Sprintf(FORMAT, "en", fmt.Sprintf("Index - %s", dir), content)
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

func GetMetadata(source string) (lang string, title string, timestamp string) {
	newline := strings.IndexRune(source, '\n')
	source = source[:newline]

	if len(source) > len("<!-- :: :: -->") {
		source = source[4:strings.Index(source, "-->")]
		splitted := strings.Split(source, "::")
		if len(splitted) == 3 {
			lang = strings.TrimSpace(splitted[0])
			title = strings.TrimSpace(splitted[1])
			timestamp = strings.TrimSpace(splitted[2])
		}
	}

	return
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

	lang, title, timestamp := GetMetadata(string(source))

	var buffer bytes.Buffer
	if err := md.Convert([]byte(source), &buffer); err != nil {
		fmt.Println(fmt.Errorf("warning: error compiling file %s: %v", path, err))
		return
	}

	target := path[:strings.LastIndex(path, ".md")] + ".html"
	content := fmt.Appendf(nil, FORMAT, lang, title, buffer.Bytes())

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
	parent := filepath.Base(filepath.Dir(path))
	if parent != "." && strings.HasPrefix(parent, ".") {
		return filepath.SkipDir
	}

	if filepath.Ext(path) == ".md" {
		Build(path)
	}

	return nil
}

func WriteTemplate(lang string, target string, title string) {
	timestamp := time.Now().Format(time.DateTime)
	content := fmt.Sprintf("<!-- %s :: %s :: %s -->\n", lang, title, timestamp)
	if err := os.WriteFile(target, []byte(content), 0600); err != nil {
		fmt.Println(fmt.Errorf("cannot write to file %s: %v", target, err))
		os.Exit(1)
	}
}

func main() {
	var serveMode bool
	var newMode bool
	var lang string
	var target string

	flag.BoolVar(&serveMode, "serve", false, "server mode")
	flag.BoolVar(&serveMode, "s", false, "server mode")
	flag.BoolVar(&newMode, "new", false, "new mode")
	flag.StringVar(&lang, "lang", "", "set HTML language")
	flag.StringVar(&lang, "l", "", "set HTML language")
	flag.StringVar(&target, "output", "", "set file to create")
	flag.StringVar(&target, "o", "", "set file to create")

	flag.Parse()

	if serveMode {
		fmt.Println("Serving on localhost:6969")
		http.ListenAndServe(":6969", http.FileServer(http.Dir(".")))
		os.Exit(0)
	}

	if newMode {
		args := flag.Args()
		var titleB strings.Builder
		for _, a := range args {
			titleB.WriteString(a)
			titleB.WriteRune(' ')
		}
		title := titleB.String()
		title = strings.TrimSpace(title)

		if title == "" {
			fmt.Println("No title specified")
			os.Exit(1)
		}

		if lang == "" {
			fmt.Println("No language specified")
			os.Exit(1)
		}

		if target == "" {
			fmt.Println("No target specified")
			os.Exit(1)
		}

		WriteTemplate(lang, target, title)
	}

	if err := filepath.WalkDir(".", BuildWalker); err != nil {
		panic(err)
	}

	MakeIndexes()
}
