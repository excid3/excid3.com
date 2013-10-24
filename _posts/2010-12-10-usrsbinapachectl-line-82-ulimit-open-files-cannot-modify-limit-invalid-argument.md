---
title: '/usr/sbin/apachectl: line 82: ulimit: open files: cannot modify limit: Invalid argument'
author: excid3
layout: post
dsq_thread_id:
  - 188702320
categories:
  - News
---
Setting up a site on apache on my Macbook this evening, I needed to restart Apache. I did the usual `sudo apache2ctl restart` and got this error:

`/usr/sbin/apachectl: line 82: ulimit: open files: cannot modify limit: Invalid argument`

This turned out to be caused by an update in the apachectl script to OSX 10.6.5. A quick edit of the the apachectl script and you’re back to the races. Simply edit the following line (for me it was line 64):


    ULIMIT_MAX_FILES="ulimit -S -n `ulimit -H -n`"

and replace it with:


    ULIMIT_MAX_FILES=""

Pretty simple fix, but certainly something that shouldn’t have been overlooked by Apple.