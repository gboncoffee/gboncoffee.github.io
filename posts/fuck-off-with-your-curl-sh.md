<!-- en :: Fuck Off With Your `curl | sh` :: 2024-09-27 23:24:06 -->

# Fuck Off With Your `curl | sh`

Fuck off with your `curl something something something | sh` to install your
tool.

And this is not about security. I trust HTTPS. I trust you. But I want to know
**WHAT THE FUCK ARE YOU DOING WITH MY SYSTEM WITHOUT HAVING TO READ A FUCKING
BASH SCRIPT IN A RANDOM URL**. I just want to know how the installation of your
tool work. What should be done to get your tool installed. Where are the paths?
Which binaries?

Long story short, I was going to install "GHCup" which is a manager for Haskell
or something, and the website told me to do a `curl | sh` to do shit in my
system and have a `ghcup` command working. Fortunatelly, they had a link which
read "I don't like `curl | sh`" right below the command line. I clicked it and
it read something like this:

> ### Manual installation for Unix
> Download the binary from https://somewhere and put in your goddamn `$PATH`.

## DO YOU THINK I'M WHAT? FIVE?

Do you fucking think I cannot understand how to download a fucking binary and
put somewhere in my `$PATH`? **JUST SAY TO ME FOR YOUR TOOL TO WORK I JUST NEED
1 (ONE) UNIT OF `ELF 64-bit LSB executable, x86-64, version 1 (SYSV)` SOMEWHERE
IN THE FUCKING `$PATH`. I DON'T NEED A FUCKING BASH SCRIPT TO DO THAT.**

Hell. That's why I like the `go` installation. They just say it to you: unpack
the release somewhere. Put `somewhere/bin` in your `$PATH`. Now I know
everything that's happening on my system. Fuck.

I'm not even doing the installation. I'm going to sleep, it's almost midnight at
UTC-3. Tomorrow I'll maybe download your goddamn ELF.
