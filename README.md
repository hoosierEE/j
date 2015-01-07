J Scripts
=========
I'm learning [J][jlang]. These scripts will follow my progress as I attempt to do useful things and generally stumble my way into learning the language. It's pretty fun so far.

catOne
------
This script demonstrates some of J's abilities to work [with files][files].

Example output:

    ┌──────┐
    │hi.ijs│
    └──────┘

    #!/usr/bin/jc
    NB. obligatory

    stdout 'hello world from J' NB. print the words 'hello world from J' to stdout

    echo'' NB. print newline
    exit''


chord
-----
First calculates the great-circle distance between two latitude/longitude pairs, then the number of wavelengths within that distance of a particular FM radio station.

hello
-----
To the world, naturally.

mortgage
--------
Calculates a monthly mortgage payment using the most common/popular formula, with some initial assumptions about term, interest rate, etc. Convenient while house-shopping.

nums
----
Some of the (many!) ways to represent a number in J. Currently used as a test for [syntax highlighting][syntax].

challenge
---------
Found a page with a "prove you're a real programmer" challenge and thoguht it would be fun to tackle in J. Not interested in this job at this time, just the challenge.

[syntax]: https://github.com/hoosierEE/vim-j
[files]: http://www.jsoftware.com/docs/help803/dictionary/dx001.htm
[jlang]: http://jsoftware.com
