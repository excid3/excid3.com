---
title: Upgrading to Dropbox 1.0 on Ubuntu
author: excid3
layout: post
dsq_thread_id:
  - 195479119
categories:
  - General
  - Ubuntu
tags:
  - 1.0
  - dropbox
  - Ubuntu
---
[Dropbox][1] has to be one of my favorite services. I honestly don’t know what I would do without it.

Recently Dropbox moved up to version 1.0. Awesome! Right? Well, how do you upgrade to it in Ubuntu? The nautlius-dropbox package you installed didn’t receive an upgrade because no Dropbox repository was added to your sources. So what do we do?

Simple. Just stop Dropbox and remove the daemon.

![Dropbox][2]
Step 1) Close Dropbox
Step 2) Open up Terminal
Step 3) rm -rf ~/.dropbox-dist
Step 4) Start Dropbox again from Applications->Internet->Dropbox

Let Dropbox install the proprietary daemon again, and once it’s done, you’ll be happy to see that Dropbox 1.0 is installed and running. Complete with Selective Sync! ![:D][3]

   [1]: http://dropbox.com
   [2]: http://excid3.com/blog/wp-content/uploads/2010/12/dropbox.png (dropbox)
   [3]: http://excid3.com/blog/wp-includes/images/smilies/icon_biggrin.gif
