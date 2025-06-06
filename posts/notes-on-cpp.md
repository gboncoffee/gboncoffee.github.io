<!-- en :: Notes on C++ :: 2024-10-20 21:50:44 -->

# Notes on C++

This is a list of stuff to remember when programming in this hell of a language
called C++. I hate every single second of my life when I'm programming with it.
Unfortunatelly, I'm forced to some times.

By the way, this is mostly about C++98, except when noticed. The sanest version.
Yes. Even the sanest version.

I'll update this rather frequently.

- Never, ever copy a `std::vector`. They create a new instance of the underlying
  memory every time you copy them. Always keep only a single instance and pass
  pointers to it. Yes, this means you have to dynamically allocate them when
  they're shared with lower stack frames.
- Never, ever copy `std::string` also.
- Always reserve space in `std::vector`. Never, ever create one without
  reserving sane space first. They usually grow in dumb always, for example
  starting at 0 capacity and growing by 50% at each increment, when the sane way
  would be starting at about 8 and grow by doubling.
- Never use `std::endl`. They force a flush onto the underlying stream. A
  newline will flush a life-buffered output stream anyways, and you definitely
  don't want to force flush a file output.
- Avoid `static` duration objects as their initialization and termination
  processes happens at a not well-defined time.
- Classes only have RTTI when they're virtual, so, if, for some reason, you (May
  God help you) need typeinfo for a non-polymorphic class, you must use a
  placeholder USELESS virtual function like `virtual void
  ImAClownForCodingInThisShittyLanguage()`.
- When you have a `std::vector<T>`, passing a `T*` to it's `push_back()` method
  may compile without errors and fuck you a lot.
- If you have a `std::vector<T*>`, calling it's `clear()` won't delete the
  memory of the objects the vector holds, tho it'll call it's destructors.
