---
title: 'Unable to open file: unknown opcode'
author: excid3
layout: post
aktt_notify_twitter:
  - yes
aktt_tweeted:
  - 1
dsq_thread_id:
  - 105964066
categories:
  - Keryx
  - Python
tags:
  - elfclass64
  - lineno
  - opcode
  - pyinstaller
  - wrong elf class
---
Well, this certainly isn’t too common of a problem it appears. I have been searching for a bit today trying to work out a recent Keryx bug that has crept up on our current stable release. Took me a little bit but I seem to have figured it out.

Now this all is all based around our Pyinstaller Linux binary. We packaged this with 1.4 (pre-release) and didn’t think much of it until now. It seemed that the release we had built ran fine on Ubuntu 32 and 64bit releases. That has proved to be an incorrect assumption now. Something must have changed in the latest Ubuntu release that caused this to break. Maybe it’s libraries that have changed, maybe it’s something else. I’m not sure.

What happens is when you run the Pyinstaller Linux binary of Keryx on a 64bit machine, you receive the following errors:


    /usr/lib/gio/modules/libgvfsdbus.so: wrong ELF class: ELFCLASS64
    Failed to load module: /usr/lib/gio/modules/libgvfsdbus.so
    /usr/lib/gio/modules/libgioremote-volume-monitor.so: wrong ELF class: ELFCLASS64
    Failed to load module: /usr/lib/gio/modules/libgioremote-volume-monitor.so
    /usr/lib/gio/modules/libgiogconf.so: wrong ELF class: ELFCLASS64
    Failed to load module: /usr/lib/gio/modules/libgiogconf.so
    XXX lineno: 320, opcode: 54
    Unable to open file: unknown opcode


This appears to happen when opening the gzip files which we downloaded just before the error occurred. The rest of the application seems to have normal execution. Testing this exact same release on my Eee PC running 32 bit Ubuntu 10.04, you can imagine that it worked perfectly fine. So it appears that something in the Python gzip libraries that was dynamically linked (and not bundled into the executable) has changed and is no longer compatible.

I’m working on building a 64bit copy of the Linux executable using Pyinstaller for those users. I’ll post an announcement on the Keryx website when it is available.