---
title: Python IRC Logbot Rewritten
author: excid3
layout: post
dsq_thread_id:
  - 154262580
categories:
  - Python
tags:
  - irc
  - irssi
  - logbot
  - logs
  - Python
---
Lately I’ve been extremely busy with work, school, and life in general. It’s hard to find time to just sit down and work on a project for fun. I decide this weekend I would, and after a few comments of my IRC bot having some issues. Sounds like a good place to start.

Surprisingly it’s been several months since I have written anything in Python. I’ve been working primarily in Ruby and Rails lately and have started to become quite a fan. Sitting down trying to look at my messy, repetitive code from when I first wrote this bot was useless. Most of it didn’t make sense, and the logic behind most things was just plain messy. I sat down yesterday and looking at the old code, began to rewrite it entirely from scratch. Deadmau5 blaring in the background, caffeine running through my veins, I got a rewrite out quickly, and with more features than before. Configs are still missing, but everything is working in tip top shape, with a much more elegant but similar approach compared to before.

![][1]

Above is a screenshot of [some example logs.][2] It uses the [IRSSI][3] style with custom coloring. Timestamps on the left are linkable, and it also creates indexes for channels and dates logged. It’s a single file, using the python-irclib library and nothing else. Hopefully it’ll be useful to someone as a logbot, or inspiration for improving their coding practices. You can download the bot over at .

   [1]: http://excid3.com/blog/wp-content/uploads/2010/10/Screen-shot-2010-10-10-at-4.05.10-PM-300x71.png (Screen shot 2010-10-10 at 4.05.10 PM)
   [2]: http://excid3.com/logs
   [3]: http://www.irssi.org
