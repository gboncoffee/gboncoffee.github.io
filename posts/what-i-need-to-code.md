<!-- en :: What I Need to Code :: 2025-03-22 14:09:01 -->

# What I Need to Code

## (And how could I maybe swap things out)

Recently,
[an Ubuntu developer announced plans to migrate from the GNU Core Utils to uutils/coreutils](https://discourse.ubuntu.com/t/carefully-but-purposefully-oxidising-ubuntu/56995).
While this post won't discuss the problems with this migration, I myself will
not stay using Linux Mint in the case they follow the future change. This made
me think about what tools I currently need to work, and how can I future-proof
my programming setup.

## Context

For context, my work is mostly coding in C, C++ and Go. Sometimes I like to play
with other languages: mainly Lua, Haskell, Elixir and Erlang.

## My setup

Nowadays, I depend heavily on Visual Studio Code, mainly because it's simply
the better option in most things I value a lot: it's Git and GitHub integration,
it's LSP support, it's graphical debugging support, it has an rather ok file
manager, I could easily setup `.editorconfig` support and automatic formatting,
etc.

Here are a bunch of articles that historically explain how I got to this point:

- [On Text Editors](/posts/on-text-editors.html), on which I wrote about my
  text editor hopping journey and features I like (at the moment).
- [A Review On My Own Post On Text Editors](/posts/update-on-text-editors.html),
  on which I wrote about the Unix philosophy, graphical desktops, modes of
  editing and a bunch of other stuff.
- [Another Update On Text Editors](/posts/update-on-text-editors-again.html), on
  which I wrote about getting into [Plan 9 From Bell Labs](https://plan9.io/plan9/)
- [I Completely Disagree With My Own Opinion](/posts/i-completely-disagree-with-my-own-opinion.html),
  on which I wrote about how I went back to Visual Studio Code.

For quick stuff I use [micro](https://micro-editor.github.io/).

There are three obvious problems with my dependency on VS Code: first, Microsoft
is not reliable at all. Second, it keeps me stuck in Linux because it does not
work in any other free Unix-like. The recent events made me realize I must
be ready to migrate to other operating system shall I need, so that's extremelly
important. Third, the VS Code distributed by Microsoft is a proprietary freeware
and not a clean build from the MIT licensed VS Code repository.

I started to write a text editor with the future goals of supporting most of the
stuff I use on VS Code, but this is more of a long-term project and I need more
immediate solutions.

Let's approach the problem by analysing each of the features I use and how could
I swap them out.

### Git

I use a lot of the Git and GitHub integration in Visual Studio Code, because
it's simply amazing. To be fair, this is mostly a quality-of-life improvement
over command line Git and it's not that important. I tried other Git clients
but the only one I also like is Magit, which is specific for Emacs, and I have
some problems with the fact that Emacs has a shitty interface that did not
improved over the last 50 years.

### Debugger

Man this is heavy.

I like to use LLDB in VS Code because it works greatly, and I also prefer the
LLVM toolchain over the native one. I never managed to actually understand how
to use the LLDB tui, though, so if I need for some ungodly reason use a debugger
in the terminal, I use GDB. For debugging Go, I use of course Delve.

I would like a solution with the same UI for both LLDB and Delve. Outside editor
plugins, there's none I know of. Actually, I never used any debugger GUI except
for the VS Code's one. I know Emacs also has DAP clients available, but again I
have some problems with Emacs' interface.

### LSP

Any editor with LSP support will work. Autocomplete is really neat, but what I
really want to have is symbol renaming, goto-definition and this kind of stuff.
To be fair, goto-definition can be achived for anything with ctags, and both Go
and the LLVM toolchain have tools to do symbol renaming. But LSP gives all of
that in a polished package.

Acme has a LSP client that I never tried. Emacs has (supposedly good) LSP
clients.

### Formatting

I use `gofmt` and `clang-format`. I like it very much if my editor runs them
automatically. LSP can be a substitute for that also.

I also use `.editorconfig`, and something that keeps me out of Acme for instance
is the fact that it simply does not support tab expansion.

### File manager

I like file managers/explorers integrated into my development environment, but
VS Code's one is just ok, not great.

## My problems regarding interfaces

I don't think 50 year-old interfaces like Emacs' and Vim's are good at all. I
think the correct way of doing minimalistic interfaces nowadays is the Plan 9
way: modern yet simple. The mouse was invented and it's good. Graphics were
invented and they're good. There's no scientific study showing that those old
terminal or terminal-like interfaces are any better than proper graphical ones.

## Conclusions

I didn't cited Textadept but it actually looks like a great alternative for me.

Acme, Textadept, Emacs, each one has pros and cons. In the end none can give me
the same sum that Visual Studio Code can. I'll probably have to spend some time
working on setups with these editors to achieve my goal.
