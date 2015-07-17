---
title: Getting Started with Ubuntu, CodeBlocks, and GLUT
author: excid3
layout: post
dsq_thread_id:
  - 164068073
categories:
  - Ubuntu
tags:
  - codeblocks
  - glut
  - opengl
  - Ubuntu
---
One thing I’ve been doing lately is getting into a little OpenGL. I’ve been using GLUT in Code::Blocks and really don’t mind it at all. As your typical Vim user, I find IDE’s to be bloated, ugly, and just plain messy to work with. I figured being mainly a scripter, I was biased because most of the languages I use are filled with beautiful stack traces that allow for easy debugging.

It’s been a while since I went back to C and I always used Visual Studio for development (because that’s what the school uses). Sure, I should have fought the power and built GCC compatible binaries, but in the long run, it’s easier to just build it in the environment it’ll be tested on and worry about building good software in my free time.

Here’s the couple of steps I did to get started with Glut on Ubuntu 10.10:

  1. Installed the dependencies: build-essential, codeblocks, and freeglut3-dev
  2. I fired up Code::Blocks and created a new GLUT project.
  3. Choose the GCC compiler and when it asks you where GLUT is installed, just tell it /usr. All the headers should be located in /usr/include and libs in /usr/lib so that’s why you just tell it to use /usr.
  4. Compile and debug away!