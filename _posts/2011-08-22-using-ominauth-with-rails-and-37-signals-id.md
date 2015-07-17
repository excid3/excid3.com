---
title: Using OminAuth with Rails and 37 Signals ID
author: excid3
layout: post
dsq_thread_id:
  - 393212040
categories:
  - News
tags:
  - 37signals
  - fun
  - oauth
  - omniauth
---
If you’ve ever used Omniauth, it’s probably one of the most useful damn gems to come across.

There are lots of examples with your basic Twitter and Facebook auth, but sometimes it is hard to find examples on others. Take 37Signals ID for example. I wanted to integrate this but it wasn’t being helpful at all. I’d get redirected but `response_type=code` was being set and didn’t seem right. When you click the login link you just get taken to a blank web page.

Thankfully [sferik][1] contributes to like every single ruby project on github explained the reason for this [here][2] where a solution was posted to the problem:


    config.omniauth :thirty_seven_signals, client_id, client_secret, {:type => 'web_server'}


And voila! You’re off to the races. The `response_type` still gets sent even though it shouldn’t be, however this doesn’t screw up anything.

   [1]: https://twitter.com/#!/sferik
   [2]: https://github.com/intridea/omniauth/issues/280
