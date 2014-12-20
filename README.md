J Scripts
=========
I'm learning [J](http://jsoftware.com). These scripts will follow my progress as I attempt to do useful things and generally stumble my way into learning the language. It's pretty fun so far. I really appreciate the consistency of the language, and programming at the function level is very eye-opening.

catOne
------
This script demonstrates some of J's abilities to work [with files](http://www.jsoftware.com/docs/help803/dictionary/dx001.htm).

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
First calculates the great-circle distance between two latitude/longitude pairs, then the number of wavelengths of a particular FM radio station in that distance.

hello
-----
Always a good choice.

mortgage
--------
Calculates a monthly mortgage payment with some initial assumptions (term, interest rate, etc).

nums
----
Some of the (many!) ways to represent a number in J.

webserver
---------
Taken from [here](http://www.jsoftware.com/jwiki/JWebServer), the only change being `x.` and  `y.` become `x` and `y`.

test
----
Found a page with a "prove you're a real programmer" challenge and thoguht it would be fun to tackle in J. Not interested in this job at this time, just the challenge.
