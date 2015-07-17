---
title: Removing toolbars from GVim
author: excid3
layout: post
dsq_thread_id:
  - 177719215
categories:
  - General
tags:
  - gtk
  - gvim
  - vim
---
One of the things I realized going back to work on Ubuntu recently was GVim’s configuration differences from MacVim. Biggest problem? The toolbars are HUGE!

Here’s how you remove them in your .vimrc:


    set guioptions-=m
    set guioptions-=T


“m” is for menu and “T” is for toolbar. Simple as that!