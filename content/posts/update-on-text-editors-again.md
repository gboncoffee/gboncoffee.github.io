+++
title = 'Another Update On Text Editors'
summary = "Yet another one."
date = 2023-12-21T01:49:27-03:00
draft = false
+++

# (or How I Got Into The Nerdiest Thing Ever + Rant On Modern Unix)

Some weeks ago I wrote [a blogpost]({{<ref on-text-editors>}}) about my journey on
text editor hopping, and them [another blogpost]({{<ref update-on-text-editors>}})
reviewing my own post. Well, here we go again.

In the last post I wrote about Plasma and the Unix philosophy in the desktop but
that's mostly bullshit. And that's why the Linux desktop is a mess.

Instead of the original Unix idea of multiple programs writing text to others,
the Linux desktop is based on other APIs like the X server itself, dbus and
etc.␣And often they don't talk the same language. QT vs GTK is an example of
this, alongside with desktop portals, notification daemons, etc.

Well, I wasn't happy with Plasma's design philosophy because of bloat. I tried
GNOME but it's worse. End up on XFCE.

XFCE is better as it's simple and minimal. But I really wanted to go back to
using window managers and stuff like that.

What I found out is that, in the end, what I really care about is having a sane
and cohesive shell (using "shell" as "interface"). Plasma is a kinda cohesive
graphical shell, but it's not that efficient. Menu-bar-driven, two-button mouse
systems, i.e., the modern graphical paradigm popularized by the Microsoft
Windows operating system, is not efficient.

One could argue that the Unix terminal is more efficient, but I found it very
incohesive. First, the shell language is a mess. Second, the command argument
syntaxes are very diverse. Third, the ANSI terminal itself. It's an ancient hack
that stick with us and should've been dropped when graphical interfaces became
popular. We'd never implemented simple graphics API though so the result is that
it's 2023 and we're still using curses. Also, modern Unix got a lot of stuff
wrong, mainly due to the Free Software Foundation and the GNU project push
towards the bloat. Much GNU documentation is acessible via the `info` pages that
nobody really knows how to read, some commands have a `--help`, some have the
manual (which is much better than any other alternative, *specially* `info`
pages). And the manual opens inside the pager with a broken view in my terminal
because it doesn't support bold.

And them we got Emacs. Emacs is actually a very cohesive shell, but it's
painfully slow and it's not particularly efficient. It's probably the least
painfull way to use the GNU system "the way it was intented" nowadays, which is
kinda funny because Emacs is it's own containeirized Lisp operating system.

Wandering through the web, I read some Rob Pike's papers and found out the
nerdiest thing in computing: [Plan 9 From Bell Labs](https://plan9.io/plan9/).
It's almost perfect. The graphical shell is extremelly efficient, the mouse
usage is geniously simple and easy, yet fast. The entire system is very simple
and straighforward. So much that I had the Plan 9 From User Space port installed
in my Debian system and in a couple hours I had learned everything I had to
learn to be as efficient as I'm after years of learning Unix with my new shell
and toys.

Acme is specially a rather efficient shell. And, different from the hack that's
the graphical Emacs, it was meant to be a shell. Everything is so cool that I'll
be changing to a very minimalistic Unix system -
[Alpine](https://www.alpinelinux.org/), so I can have everything in busybox and
statically linked with musl - and using basically the Plan 9 tools and other
minimalistic software to do my computing. I liked Plan 9 so much that I'm
writing my own `rio` clone for X11.

And I know exactly what I liked in it. Basically, the system allows, via the
mouse, easy and free exchanging of text between different programs, running in
parallel in the graphical environment, with a cohesive interface. It's possible
to create such shell for Unix, but it would be a rather difficult task. Much
difficultier than for Plan 9 as there would be no support from the system
itself. I may try it though.
