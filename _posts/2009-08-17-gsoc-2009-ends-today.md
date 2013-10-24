---
title: GSoC 2009 Ends Today
author: excid3
layout: post
dsq_thread_id:
  - 55195818
categories:
  - GSoC
  - Python
tags:
  - gsoc
  - winlibre
---
Hard to believe Google Summer of Code 2009 is over already and that school will be starting up next week. I want to say thanks to Bertrand Cachet and Pierre-Jean Coudert for their support as mentors on WinLibre.

Our project has come a long ways. With some initial design hurdles past us, we were able to get hard at work creating a package system for Windows that would be both reliable and flexible. There are a lot more design issues with a package system on Windows than we had anticipated, especially with the vast amount of ways that applications are released to the public. We designed WinLibre to be extremely simple to package and release for developers without having to change the way they currently ship their releases.

I was tasked with the package creator. All in all it was a good end result, got a lot done and learned an indescribable amount of things. I was able to implement as much as possible without a few features from the other students in the project. We’ve all had our plates full and had some rough times but it’s about the love for open source and community when it comes down to it. Here are a list of things working in the package creator:

  * CLI support
  * wxPython GUI
  * Initialize package
  * Set package meta data
  * Set install scripts
  * Add files to package

A few things have yet to be completed such as package relationships (depends, recommends, etc), install script templates and examples, sample packages, and package submission to the repository. These features will be implemented in the future and I plan to continue contributing to this project.

Google Summer of Code has brought a lot of good experiences to many students, teaching them about community, open source, and even things about themselves. I want to thank Google for sponsoring such a wonderful program and to all those who participated!