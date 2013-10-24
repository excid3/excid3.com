---
title: Ubuntu Color Terminal
author: excid3
layout: post
aktt_notify_twitter:
  - yes
  - yes
aktt_tweeted:
  - 1
dsq_thread_id:
  - 120891922
categories:
  - Ubuntu
tags:
  - color
  - terminal
  - Ubuntu
---
So one of the things that might get annoying is Ubuntu’s plain terminal. You see everyone else with these sweet terminals, but when you make the configuration changes, it actually messes up the terminal options for changing colors! There’s actually a really simple configuration change in bashrc that will allow you to have a color terminal but continue using the colors in your profile flawlessly too:

> gedit ~/.bashrc
Find this line: “#force_color_prompt=yes” and delete the “#” so it looks like “force_color_prompt=yes”
Save and close
Restart terminal

Voila! And you get something like this: ![][1]

   [1]: http://excid3.com/blog/wp-content/uploads/2010/07/color_terminal.png (color_terminal)
