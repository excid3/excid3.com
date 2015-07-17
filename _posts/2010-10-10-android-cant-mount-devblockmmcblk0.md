---
title: 'Android: Can’t Mount /dev/block/mmcblk0'
author: excid3
layout: post
dsq_thread_id:
  - 154290010
categories:
  - Android
  - Hacking
tags:
  - Android
  - bugless beast
  - cyanogen
  - mount
  - rom
  - sd card
---
Since I’ve got 3 Android phones, I might as well root them right? I’ve been happily running Bugless Beast 0.4 on my Verizon Droid for several months now and it is faster than my Nexus One running CM6 by a long shot. This rom is awesome, so I wanted to install BB0.5 when it was released.

Well, it wasn’t as easy as I had planned. Using Rom Manager, I used the clockwork recovery to try to install it. No dice. Some weird “Can’t Mount /dev/block/mmcblk0″ error. Same thing with CM6. What gives?

I tried this a month back, but I only got it working now. Maybe it was an update in Rom Manager that fixed it or something. I read removing the SD card to make sure it is in place might help. BB0.4 could mount it, so I knew the card was fine. It was something with the recovery. I came across this before and tried Doctor’s suggestion:  The first time it didn’t work for me, but it did this time around.

**The steps to fix this are as follows:**

  1. Open Rom Manager
  2. Menu -> Clear Download Cache
  3. Flash Alternate Recovery
  4. Reboot phone
  5. Open Rom Manager again
  6. Install your new rom (and Wipe Data and Cache)

Cross your fingers and hopefully it should work for you. I’m happily running Bugless Beast 0.5 now. ![:D][1]

   [1]: http://excid3.com/blog/wp-includes/images/smilies/icon_biggrin.gif
