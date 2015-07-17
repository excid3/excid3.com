---
title: Cross-Platform Version Comparison
author: excid3
layout: post
dsq_thread_id:
  - 55195792
categories:
  - Debian
  - GSoC
tags:
  - Debian
  - dpkg
  - Python
  - Ubuntu
  - version comparison
  - winlibre
---
For both [Keryx][1] and [GSoC 2009′s WinLibre][2], we were in need of a Python port of dpkg’s version comparison algorithm. Instead of hacking together some new code, I decided to port dpkg’s algorithm straight from C to Python. The end result? A clean and simple algorithm that is capable of comparing quickly and accurately along with returning results in standard Python sorting function format (-1 for less than, 0 for equal, 1 for greater than). This function can be used on a list to sort versions with the [].sort() function. Very handy and being written in pure Python makes it an excellent choice for cross-platform apt tools like [Keryx][1] as well as apps like WinLibre who use the same versioning system as Debian.

Check out the code here: http://bitbucket.org/excid3/winlibre/src/tip/wpkg/vercmp.py

   [1]: http://keryxproject.org
   [2]: http://excid3.com/blog/projects/winlibre
