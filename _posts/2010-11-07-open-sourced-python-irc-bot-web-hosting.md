---
title: 'Open Sourced &#8211; Python IRC Bot Web Hosting'
author: excid3
layout: post
dsq_thread_id:
  - 168680177
categories:
  - Hacking
tags:
  - dbus
  - django
  - irc
  - Python
  - web
---
A while ago I had the idea to build a Django web app to serve up IRC bots for people. It’s a pain to have to maintain bots on your own box. Why not provide a web interface for management?

Obviously there wouldn’t be a whole lot of people using something like this. The only reason I attacked this was a challenge to myself. Learn threading, learn dbus, learn Django. After putting some solid time into it, I had a daemon that managed and launched IRC bots from a web interface. I thought it was awesome. Sure enough, life happened, and I totally forgot about it. There is certainly no way I’ll be finishing the application due to time and lost interest in the problem I was trying to solve.

Since I’m never going to do anything with this, there is no reason to keep it in a private repository anymore so I’ve decided to open source it. If you’re interested in Python, Django, DBus, Threading, or IRC and sockets, you might find a good use for this. It’s all GPL’d so go have some fun if you are interested.

