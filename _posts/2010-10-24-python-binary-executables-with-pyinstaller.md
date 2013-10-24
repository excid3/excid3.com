---
title: Python binary executables with Pyinstaller!
author: excid3
layout: post
dsq_thread_id:
  - 161464249
categories:
  - Keryx
  - Python
tags:
  - binary
  - executable
  - pyinstaller
  - Python
---
We’ve had a hard time finding a decent Python binary builder. This is of course coupled with our requirement that it needs to build the wxWidgets binaries with it. I’m sure that it’s not a terribly easy task to build such a library that is capable of this. We’ve finally found a pretty decent solution I think.

Pyinstaller has hit version 1.4 and supports quite a few popular libraries out of the box. This turned out to be a godsend after we had fiddled for a long time with py2exe and then had to figure out yet another tool to build a Linux binary. Pyinstaller can build for Windows, Linux and OSX!

The only downside I have seen to using Pyinstaller so far is that we have to consistently build individual releases of Keryx along with each release of Ubuntu. As so many things regarding libraries between each release, it’s incredibly hard to have a binary that works across multiple releases.

That’s about all I can say about Pyinstaller, it works, and it works quite well. You can grab the latest release of Pyinstaller over at [www.pyinstaller.org][1] if you are looking to build a Python binary for your application.

   [1]: http://pyinstaller.org
