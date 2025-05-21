<!-- en :: A Review On My Own Post On Text Editors :: 2023-10-20 21:24:49 -->

# A Review On My Own Post On Text Editors

Some time ago I wrote a
[blogpost about my journey in text editor hopping](/posts/on-text-editors.html)
On the very bottom of the post, I talked about my overall current opinions
on editors and how I may write one. Here I want to update that.

As a resume, I became more minimalist because I tried a lot of editors and
addressed what really matters in an editor, what is really usefull. And I
talked with more experienced people too.

Also, I found out that the Unix philosophy is really great, and that there's a
really neat way of applying it for a graphical environment. I'll talk about
that in the end of this post.

## The *compile-mode*

It's not that usefull. Yeah, I said it was my favorite feature from GNU Emacs
but I just changed my opinion. Follow the history:

I was upset that Emacs was terribly slow in my University computers. So
I was using Vim. For the sake of keeping with the defaults, I
wasn't using the plugin I wrote that mimics *compile-mode* for it,
[run.vim](https://github.com/gboncoffee/run.vim). I tried Vim's `:make` but
it's simply terrible. One of my teachers uses Vim, and I asked him what he
uses for compiling. He said that he just opens another terminal window and
compiles from there, jumping errors manually. When I told him I would like
something that jumps errors for me and stuff like that, he just told me that
he never needed that much efficiency. He's not programming on the market,
he's just a scientist whatsoever.

When thinking about that, I found out that a lot of times I just can't use
*compile-mode* or some clone because I need to test programs interactively
in the terminal, or when programming for X I need to test inside of
Xephyr. Furthermore, ditchin made me open the eyes for a lot of other editors.

## Trying stuff out

On the modal side, I'm using both Kakoune and Vim. Vim is a big editor with
tons of features and lacks good mouse support. Kakoune is a small editor
with not that much features and lacks good mouse support. Of course, both
are modal and I'm not really into modal editing anymore.

Besides that, window managing with Kakoune is a mess, because as it creates
multiple terminal or tmux windows, the command prompt always changes location
and I need to remember what window is the main one to don't close them all. I
really like Kakoune's multiple cursor support though.

Kakoune does try to follow more the Unix philosophy them Vim, though. But
there are things that I don't like in the way it does it. For example,
while editing Go code, I found out that if I pipe my file into `gofmt` with
Kakoune's pipe command but some syntax error make `gofmt` fail, Kakoune will
substitute my entire file for nothing (the stdout of a failed `gofmt`) and
I must type `u` to undo that. That's not that big of a deal but pisses me off.

Also, I think that modal editing creates an unecessary overhead and just
using control and meta keybinds is better. The lack of good mouse support
in both editors is not good too.

So yeah, they're very great editors if you code in a 1980's text terminal
without mouse. But in the 1980's text terminal you also wouldn't have color
support so I don't know why both editors have syntax highlighting.

# Ditching modal

I'm using three other non-modal editors nowadays besides Emacs:
- [Micro](https://micro-editor.github.io/), a modern Nano replacement.
- [A modern Sam version](https://github.com/deadpixi/sam), an editor from Rob
  Pike for the Bell Lab's Plan 9 Operating System.
- [KWrite](https://apps.kde.org/kwrite/), an editor for the KDE Plasma
  environment.

I don't like KWrite that much because I cannot deactivate the syntax
highlighting. It's my system's default editor right now thought because I'm
using KDE Plasma and I still didn't find what to use. I won't use KWrite for
real coding.

What about Sam? Sam is for nerds. And I'm a nerd. Probably the world would be
better place if we all just used Plan 9's design in everything (with a dark mode
thought). But unfortunatelly it isn't. Using Sam inside X is really clunk
because it looks like a virtual machine: I have a window manager and windows
inside another window. And Sam looks like you should learn the entire command
language and use it almost entirely from the command window. But probably
because I'm too lazy to create a bunch of keybinds to it. It has excellent mouse
support, but I need to use it a lot more inside it, and that hurts.

Micro is good, fast, has decent keybinds (I prefer Emacs' ones thought) and a
good mouse support. But lacks piping text through commands, and that's not
acceptable.

Both Micro and Sam lacks trailing whitespace highlighting, which I like a lot.

Sam also lacks support for a vertical column showing me the 80th text column,
and that's very frustrating because it's such a simple feature. Also, lacks
editorconfig support, which is also not acceptable.

With Micro I cannot change files with the mouse too, which for a mouse-centric
editor is not cool. And I need to keep line numbers in the left side of the
screen to see if my lines are being wrapped and to format the text. I don't
like those line numbers, they're a waste of space.

## The Unix Philosophy Inside X Sessions

I'm using KDE Plasma and if you think I'm not allowed to call myself a
minimalist because I'm liking it, so be it. But a good desktop environment,
not resouce-heavy, with plenty of great tools and integration is very cool.
The graphical interface and the stacking window system are two of the best
things computer people ever made. Plasma reminds me a little about MacBooks,
and that probably means someday, when I have the money, I'll buy myself a Mac.

The integration between stuff inside Plasma is very cool. I can open Dolphin
and manage files much better than inside the terminal, or with some program
like Midnight Commander. Drag-and-drop is wonderfull. Having an applet in my
panel that allows me to control *whatever* music player I use is very cool.

So, of course, I want an editor that can be integrated in the desktop. This
does not necessary means a graphical editor thought, as it's entirely possible
to open the editor inside the terminal from the desktop applications, and have
very good mouse support in it.

## The overall idea

I'll certainly create a new editor. And it'll follow this:
- Support for some kind of trailing whitespace highlighting and text-width
  column;
- Emacs-inspired keybinds but without keychords;
- Great mouse support inspired by Sam;
- Just a sane UI that does not keep in my way and show me everything I need to
  see;
- Support for editorconfig via integration with the editorconfig C program.

I'll probably write it in Go as it has great support for UTF-8 and is a very
simple and efficient language.
