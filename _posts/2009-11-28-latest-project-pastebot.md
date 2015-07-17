---
title: 'Latest Project: PasteBot'
author: excid3
layout: post
dsq_thread_id:
  - 55195704
categories:
  - Python
tags:
  - bot
  - irc
  - paste
  - pastebin
  - pastebot
---
Yesterday’s code sprint was inspired by [TeamColtra][1] who was looking for a lightweight IRC bot that was capable of accepting pastes, submitting them to [paste2.org][2], and then notifying all the recipients with the link. The idea was to make IRC pasting super simple for anyone to do.

Being a holiday weekend and it being rather boring around the house, I figured why not. So we set out to build the bot, which proved to be fairly simple. It’s structure is very lightweight and we spent a few hours working on it and eventually had the finished product: [PasteBot][3].

It is capable of sending notifications or regular messages to both channels and users as well as notifying the paster of a sucessful paste. The help message is sent whenever a user sends a PM that is not related to a paste making it easy for anyone to use.

If you find any bugs or feedback, please be sure to leave a comment or send me an email. I’d like to hear about its usefulness or improvements that could be made. Hope you enjoy it!

   [1]: http://www.travismccrea.com/
   [2]: http://paste2.org
   [3]: http://excid3.com/blog/projects/pastebot
