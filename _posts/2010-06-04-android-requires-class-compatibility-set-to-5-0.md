---
title: Android requires .class compatibility set to 5.0
author: excid3
layout: post
aktt_notify_twitter:
  - yes
  - yes
aktt_tweeted:
  - 1
dsq_thread_id:
  - 104471742
categories:
  - Android
tags:
  - Android
  - compatibility
  - error
---
“Android requires .class compatibility set to 5.0. Please fix project properties.” What’s this? It’s the error I received after cloning a repository and trying to import it into Eclipse. There is reasonably little information online about this, couple discussions on mailing lists but I figured I would write a post on the solution to this.

After importing the project to your workspace, you’ve received the error. So what you need to do next is to right click on the project -> Android Tools -> Fix Project Properties. Now this alone won’t fix the problem, you need to restart Eclipse after this. After that try building the project again and it should work successfully this time (unless you have bugs in the code itself, I did).

Hope that helps people. This my first time tinkering with someone else’s Android codebase. I’m excited!

It also might help if I mention that some things, the Android Launcher, require the full android code base in order to compile properly.