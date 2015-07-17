---
title: Nightly Automatic Backups over SSH with Rsync
author: excid3
layout: post
aktt_notify_twitter:
  - yes
dsq_thread_id:
  - 75785087
categories:
  - Debian
  - Ubuntu
tags:
  - backup
  - nightly
  - rsync
  - ssh
---
It’s been a while since I’ve posted and the reason for posting was none to thrilling. Installing Ubuntu 10.04 on my primary desktop, I only realized after the fact that the partition I chose to format for the new install was my home directory from the previous install. I guess I was just a little bit too anxious. ![;\)][1] Not losing anything too important thanks to Dropbox and my massive media partition, I decided it was important that from now on I keep remote backups of my home directory. Repurposing my old laptop whose video card has been flaky seemed like the perfect choice so I fired up Ubuntu 8.04 desktop on that machine and configured its secondary hard drive to be for backups only. I followed this nifty tutorial here: . The only modifications I had made were in the cron script which I put $LPATH before $RPATH because rsync takes SRC and then DEST as parameters in that order making the script run improperly. Using a static IP for the server laptop on my router guarantees that as long as the box is up and running, I’ll have a nightly backup of everything in my home directory.

   [1]: http://excid3.com/blog/wp-includes/images/smilies/icon_wink.gif
