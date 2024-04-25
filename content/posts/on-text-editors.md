+++
title = 'On Text Editors'
date = 2023-09-20T23:58:40-03:00
draft = false
+++

Here, I'll talk a little about my journey with a lot of text editors and what
I'm currently liking. Maybe I'll eventually try creating my own with the ideas
resumed here.

# On Text Editors

In my brief journey on computer programming - about three years right now - I
hopped text editor a lot. ***A lot***.

My first text editor was
[IDLE](https://docs.python.org/3/library/idle.html). It's an extremelly simple
text editor for Python written by Guido Van Rossum himself. It features syntax
highlighting, integrated repl and executing environment and probably more
features that I never used because I was a begginer. In retrospect, I like it's
simplicity.

I hopped to [JetBrain's PyCharm](https://www.jetbrains.com/pycharm/) a few
months into learning programming. Back then, I was running a Windows laptop with
4gb of RAM and an Intel i3 (I still use this very same hardware, but with
another 8gb stick and Arch Linux). Of course, I was overhelmed with the
features, and it runned *terribly* slow. It was so painfull that I quitted
programming for about a month. Luckily, I got motivation again after I
discovered Linux, and switched my machine to Ubuntu. A few months using it, I
started using another JetBrains editor,
[IntelliJ IDEA](https://www.jetbrains.com/idea/). It's very similar to PyCharm,
but for Java. At the time, I wasn't really understanding what I was doing, I
just kept using stuff I knew worked and though it was the way to go.

Eventually, I hopped to the nowadays everyone's favorite,
[Microsoft's Visual Studio Code](https://code.visualstudio.com/). Still, it was
slow ([Electron](https://www.phoronix.com/news/HTML5-Golang-Desktop-Apps)) but
kinda manageable. At this point I was understanding something about what I was
doing, but not everything. I could compile a Java program from the terminal, I
knew how to manage files in the terminal, etc etc etc. And my hand was hurting a
lot because of the intense use of the mouse and the swap between it and the
keyboard.

So I learned about the most loved one, [Vim](https://www.vim.org/). I switched
to it in a gradual fashion. Of course, I haven't documented the extremelly
extensive history of adding and removing plugins, switching to
[Neovim](https://neovim.io/), switching back to plain Vim, etc etc etc. When I
was in a more minimalist phase, I removed plugins, and vice-versa. I learned a
lot about everything related to computers and computer programming during that
period.

I was using a very customized Neovim with
[LSP](https://en.wikipedia.org/wiki/Language_Server_Protocol) and
[TreeSitter-based](https://tree-sitter.github.io/tree-sitter/) syntax
highlighting and all those fancy stuff that slowed it down, when I learned about
[Helix](https://helix-editor.com/). I switched to it because it had almost
everything I had in Neovim with almost no configuration. It hadn't a plugin that
I wrote to Neovim, tho: [run.lua](https://github.com/gboncoffee/run.lua). I like
compile-driven development, so not having to switch to another
[tmux](https://github.com/tmux/tmux) pane, pressing the up key, enter and them
figuring out where the previous compilation ended was very cool. Well, Helix
didn't had that and I couldn't add it as it does not have any extension system
(maybe this changed as you're reading). Anyways, I moved back to Neovim after
some time. Without LSP!

I always liked the idea of [Emacs](https://en.wikipedia.org/wiki/Emacs). But I
didn't want to drop modal editing. Anyways, I switched to Emacs with
[evil](https://github.com/emacs-evil/evil), i.e., Vim emulation. I dropped about
a month latter because the input lag was painfull. And I wanted minimalism.

So, I switched to [Kakoune](http://kakoune.org/). I configured and liked it,
specially the editing model. It's very minimalist, and I liked. It had a `make`
wrapper similar to Emacs' `compile-mode` that I always liked. Kakoune's, tho,
was simpler and not that usefull.

When I got into the university, colleagues convinced me to switch back to Vim. I
created a very simple configuration, and was kinda happy with it. But Vim always
felt like a bunch of improvisations to me. Some day, in the little middle-year
vacation, I tried Emacs with it's default keybinds. I got used to not having
modal editing very quickly. Emacs is almost a perfect environment. But it's
exactly that: a Lisp environment. Not a text editor. I'm writing from it right
now.

So, if I'm writing this, of course it means I'm not very happy with
Emacs. Mainly, I think it's overcomplicated and - as I said - more like a Lisp
environment that should have been a text editor than a text editor.

Anyways, after this historical introduction, I'll talk about what I learned I
like and what I learned I don't like.

## Design

I readed [On The Design of Text Editors](https://arxiv.org/abs/2008.06030) from
Nicolas Rougier. I don't agree with him in everything, but I liked the
overall. I don't like margins, and I think allowing the use of the mouse a
little more would be really great. Also, I don't like it's extensive use of
typesetting.

## Syntax Highlighting and Typesetting

I'm very into
[no/minimal syntax highlighting](http://www.linusakesson.net/programming/syntaxhighlighting/)
and I kinda liked some ideas of
[semantic highlighting](https://buttondown.email/hillelwayne/archive/46a17205-e38c-44f9-b048-793c180c6e84).
If I ever create a text editor, I'll probably just add code syntax for strings
and comments. Maybe no syntax at all. For Emacs and Vim, I created a color theme
that removes syntax except for strings and comments, it's called Cyber Cafe, for
[Emacs](https://github.com/gboncoffee/cybercafe-emacs-theme) and for
[Vim](https://github.com/gboncoffee/cybercafe-vim-theme).

For markup languages, I really liked the idea of changing the typesetting
according. Of course, this is only proper achieved with font-size changes and
variable-pitch fonts when using a graphical text editor. And graphical text
editors are just better.

## Keybinds

I just want a great set that allows me to achieve everything via the keyboard
when I want, navigate fast and made edits fast without making my hands and
fingers tired. Doesn't matter if it's modal or not. Actually, probably Emacs
keybinds are the better for coding.

## The Mouse

I liked the way [Plan 9 and Acme](https://plan9.io/plan9/) graphical interfaces
work. I was into tilling window managers before, but nowadays I like using a
stacking one. What I'm into is using the mouse for navigation sometimes, so
having a proper mouse support that uses all three buttons is great.

## Other Utilities And Integrations

My text editor should also have a great file manager and a fast git UI. I do not
need a mail client, nor tetris, nor web browser, nor web server, nor dunnet, nor
an ELISA clone. It should have a great way to interact with all these utilities,
tho. In a beautiful Unix fashion.

My favorite feature of Emacs is the extremelly simple `compile-mode`. It allows
you to run a command fast, and parses compiler output for jumping between errors
and etc. This is really great, I really like it. My editor should have
first-class support for compilers. There's simply no reason to not have. And no,
LSP is not the way to go (I have no article to link here as this is just too
unpopular. I think I'll have to write something about that).

Not only compilers, but repls too! Integration with repls is very great, and I
like repl-driven development for languages like Haskell, Lisp, OCaml and Lua.

But, this does not mean an integrated terminal. The way to go is opening your
editor from within a terminal, and not the opposite. That terminal session
should be used to manage various other background jobs like web servers and
stuff.

## Performance

Of course the editor should be graphical, but performance should be a
priority. I should be able to use it as my commit editor without feeling pain,
and opening it just for quick edits.
[I guess we know the way to go](https://en.wikipedia.org/wiki/Qt_(software)).
