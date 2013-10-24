---
title: Ubuntu Quickly, Python, and DistUtils
author: excid3
layout: post
dsq_thread_id:
  - 194545342
categories:
  - Keryx
  - Python
tags:
  - distutils
  - Python
  - quickly
  - Ubuntu
---
Preparing for the Keryx 1.0 release over the past couple of days, one of the things I’ve been learning is how to build Ubuntu and Debian packages. Sure sure, I’ve been “cheating” using Quickly. ![:\)][1]

Quickly is probably one of the coolest tools I have used. All the hassle of building an Ubuntu application is already taken care of, and it takes the Ruby on Rails approach to guiding you through development. It’s quite great.

As I was packaging Keryx 1.0 last night, I ran into an issue. DistUtils could not find my python modules. I was getting an `ERROR: Python XXXXXXX module not found.` when I would run `quickly package`.

Well that’s no good. Keryx runs just fine, all those modules are imported just fine. What the heck is going on??

I spent a few minutes trying to configure DistUtils py_modules to try to add them manually. No dice. It turns out that DistUtils really does not like relative path imports. Seriously?? Yeah. ![:\(][2] Sad story huh?

The most convenient solution I could come up with was to change ALL of my imports. My directory structure was pretty simple:


    bin/keryx
    keryx/
    keryx/unwrapt


`bin/keryx` is the main application. `keryx` is a folder of extra GTK code. `keryx/unwrapt` is the entire backend for Keryx. The backend is a separate module and uses relative imports so that it can function independently.

I decided to move Unwrapt into Keryx’s source tree instead of making it a separate package. This would reduce dependencies and overall make things less complicated. The solution to DistUtils problem was to simply go through and change all of my imports from relative `import XXXX` to `import keryx.unwrapt.XXXX`. You reference modules from the top level which is where DistUtils will be run from. This lets Keryx still run, and everyone be happy.

   [1]: http://excid3.com/blog/wp-includes/images/smilies/icon_smile.gif
   [2]: http://excid3.com/blog/wp-includes/images/smilies/icon_sad.gif
