---
title: 'How to fix ESC[ in your terminal'
author: excid3
layout: post
dsq_thread_id:
  - 330703716
categories:
  - General
  - Hacking
  - Ubuntu
tags:
  - colors
  - 'esc['
  - git
  - less
---
I don’t know exactly what happened the other day, but I ran a `git diff` and instead of the usual red and green colors, everything was some form of ESC[32m ESC[1m ESC[m and so on in order to tell the terminal to switch colors.


    ESC[1mindex 6008531..985ce31 100755ESC[m
    ESC[1m--- a/bin/build-site.pyESC[m
    ESC[1m    b/bin/build-site.pyESC[m
    ESC[36m@@ -1,5  1,9 @@ESC[m
     #!/usr/bin/env pythonESC[m
     ESC[m
    ESC[32m ESC[m
    ESC[32m ESC[m
    ESC[32m ESC[m
    ESC[32m ESC[m
     import getoptESC[m
     import gitESC[m
     import osESC[m


Okay this is just great. No idea what is going on, and I can’t possibly continue coding like this. After a bit of googling, there wasn’t much on the situation.

It turns out that the `less` command got misconfigured. I was working on Ubuntu and found the culprit to be the $LESS environment variable misconfigured.


    $ echo $LESS
    -eiMX
    $ export LESS="-eirMX"


These two commands in terminal will print out the $LESS environment variable and then set it. The “r” option is what is crucial here. It’s what enables coloring in less output. Another environment variable you may look at is $PAGER.

Take a look here for a really good description of the problem: 