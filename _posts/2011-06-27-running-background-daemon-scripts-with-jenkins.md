---
title: Running Background Daemon Scripts With Jenkins
author: excid3
layout: post
dsq_thread_id:
  - 343521532
categories:
  - General
tags:
  - background
  - daemon
  - jenkins
  - scripts
---
If you write code with tests and aren’t using some form of continuous integration, shame on you. It’s incredibly awesome, and if something goes wrong you can hear coworkers yell “WHAT THE HELL DID YOU BREAK?” across the room.

With [Jenkins][1], you configure it to look at a repository and provide something to run when new commits are pushed. In most cases, this will be running your tests. When they complete successfully Jenkins will give you a high five. When you don’t, well, everyone in the office gets spammed about your failure so that you can fix it before you get too far down the road and end up breaking something serious without knowing it. At least that’s the hope if you’ve got well written tests.

Now sometimes you want to use Jenkins for somewhat related things. At work we’re integrating our documentation generator (which I helped design and build as my first project). We’ve got a script that builds our full suite of documentation pages for all of our projects. So what better way to build that, than to have developers document and tag versions with git and then have Jenkins automatically build and deploy new versions of the website automatically?

We had already completed the documentation generation and written a script for Jenkins to restart the internal webserver to serve up the new documentation. It didn’t go quite as planned. You see, Jenkins is awesome. It knows to kill each process after it runs in case something failed. Maybe you create a daemon in your tests and it would get accidentally left over on test failure, so it knows better and kills it.

In our case, that’s not what we wanted. We wanted our webserver process to launch from there and stay running after Jenkins was finished. As it turns out, Jenkins sets the BUILD_ID environment variable and uses that to kill off processes at the end of each build. If you want to have a command continue running, just set the BUILD_ID to something else like so:


    BUILD_ID=WhateverYouWant python -m SimpleHTTPServer 80


It’s as simple as that. Now go start using Jenkins for everything you can think of. Automation is great.

   [1]: http://jenkins-ci.org/
