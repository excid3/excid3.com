---
title: Using Zoom 3095 Modem with Debian
author: excid3
layout: post
dsq_thread_id:
  - 55195787
categories:
  - Debian
---
Home for the summer means coming back home to dialup. I built a desktop computer for work and needed internet connectivity, even though the best I can get is dialup at home. I’ve got a Zoom 3095 USB modem and I am running a dual boot of Debian and Windows XP.

Being the Linux user that I am, working from Windows XP consistently was not much of an option so I set out to get Gnome-PPP installed on Debian. I used [Keryx][1] to gather the packages for me. The Zoom modem’s USB entry in `lsusb` was:

> `Bus 002 Device 005: ID 0803:3095 Zoom Telephonics, Inc.`

The modem was detected properly with Debian and connected fine.

The problem I’m facing is that the modem’s transfer speeds are very slow. It’s basically a 14.4 kb/s connection at best. Installing the dgcmodem driver from [linuxant.com][2] did nothing to improve the speeds I am getting. Does anyone have a fix? I’m a bit stumped at the moment for what to do.

For now I’ve setup a WinXP VM in Virtualbox and am using the modem through it. Kind of a pain but certainly easier than using two computers for work.

   [1]: http://keryxproject.org
   [2]: http://linuxant.com
