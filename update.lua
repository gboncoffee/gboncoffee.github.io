#!/usr/bin/luajit

-- 
-- author Gabriel G. de Brito gabrielgbrito@icloud.com
-- version 1.0.0
-- since Nov 01, 2022
-- 

-- 
-- Copyright (c) 2022 Gabriel G. de Brito
-- 
-- Permission is hereby granted, free of charge, to any person obtaining a copy of 
-- this software and associated documentation files (the “Software”), to deal 
-- in the Software without restriction, including without limitation the rights to 
-- use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies 
-- of the Software, and to permit persons to whom the Software is furnished to do 
-- so, subject to the following conditions:
-- 
-- The above copyright notice and this permission notice shall be included in all 
-- copies or substantial portions of the Software.
-- 
-- THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE 
-- SOFTWARE.
--

timestamp = os.date()
l = io.popen("ls -c _markdown")
updated = false

for file in l:lines() do
    local outname = "posts/" .. file:gsub(".md", ".html")

    if not io.open(outname, "r") then
        updated = true
        print("Generating article from " .. file)

        local out = io.open(outname, "a")
        -- write headers and stuff to output {{{
        out:write([[<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>]]..file:gsub(".md", "")..[[</title>
    <link rel="stylesheet" href="posts_style.css">
</head>

<body>
<p style="color: #f8f8f2;">Written in ]]..timestamp..[[</p>
<a href="../index.html">Home page.</a>
<a href="../posts.html">Other posts.</a>
]]) -- }}}

        -- write generated HTML to output
        out:write(io.popen("markdown _markdown/"..'"'..file..'"'):read("a"))

        -- write footer and stuff to output {{{
        out:write([[<footer style="color: #f8f8f2; font: normal 12pt monospace; text-align: center;">
    &copy; Gabriel G. de Brito<br>
    This content is licensed as Creative Commons CC-BY-NC<br>
    Code for this website is free and open source, licensed under the MIT
    license. Help improving it on <a style="font: normal 12pt monospace;" href="https://github.com/gboncoffee/gboncoffee.github.io">GitHub</a>
</footer>
</body>
</html>]])
        -- }}}

        out:close()
    else
        print("Skipping " .. file .. " as it already exists...")
    end
end

if updated then
    posts_file = io.open("posts.html", "w")
    -- we need to relist the directory because io:lines() only support one
    -- iteration
    l = io.popen("ls -c _markdown")

    -- write headers and stuff {{{
    posts_file:write([[<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Gabriel's posts</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

<a href="index.html">Home page.</a><br>
<ul>]])
    -- }}}

    for file in l:lines() do
        posts_file:write([[<li><a href="posts/]]..file:gsub(".md", ".html")..[[">]]..timestamp..[[ :: ]]..file:gsub(".md", "")..[[</a>]])
        posts_file:write("")
    end

    -- write footer and stuff {{{
    posts_file:write([[</ul>
<footer style="color: #f8f8f2; font: normal 12pt monospace; text-align: center;">
    &copy; Gabriel G. de Brito<br>
    This content is licensed as Creative Commons CC-BY-NC<br>
    Code for this website is free and open source, licensed under the MIT
    license. Help improving it on <a style="font: normal 12pt monospace;"
        href="https://github.com/gboncoffee/gboncoffee.github.io">GitHub</a>
</footer>
</body>
</html>]])
    -- }}}

    posts_file:close()
end
