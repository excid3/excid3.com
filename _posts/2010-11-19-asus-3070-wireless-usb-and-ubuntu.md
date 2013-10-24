---
title: Asus 3070 Wireless USB and Ubuntu
author: excid3
layout: post
dsq_thread_id:
  - 176059335
categories:
  - Ubuntu
tags:
  - 10.04
  - asus
  - drivers
  - Ubuntu
  - usb
  - wireless
---
At home, my desktop is far enough away from our wireless routers that I can’t use a wired connection. I meant to pick up a wireless card for it, but apparently forgot (go figure!). Coming home today, I realized my desktop doesn’t have an internet connection anymore because I ganked the wireless router I had setup as a client-bridge for the desktop so that I could use it somewhere else. Whoops! I’ll write up a post on using DD-WRT as a client-bridge for a wireless network if people are interested as well.

Come home, fire up the desktop, no internet. What’s the first thing that comes to mind? Yoink my parent’s wireless card from their desktop. It’s not like they use it right? My usage of the internet has to be far more important than theirs so I’ll just use this for a week. ![:P][1]

Well, being an Asus Wireless USB card with the RT3070 chipset, I figured I’d just plug it in and everything would be hunky dory. Of course not. Yeah, maybe if I was using Windows, but if I was using Windows I’d spend 30% of my time scanning for viruses, another 20% of my time cleaning out all these leftover temporary files everywhere, and the rest of the time would be trying to fix the 0×02350 error codes the software I’m trying to get working so I can just turn in my freaking homework. Okay maybe it’s not that bad, but it sure feels like it sometimes. ![:P][1]

As for the wireless card, I knew it was one of the most popular on Newegg so a few minutes of googling brought me across the following instructions that lead to a successful wireless connection!

`vim /etc/udev/rules.d/network_drivers.rules`
Put this line in the file:
`ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="0b05", ATTR{idProduct}=="1784", RUN ="/sbin/modprobe -qba rt2870sta"`
Proofread carefully, save and close.

`sudo vim /etc/modprobe.d/network_drivers.conf`
Put this line in the file:
`install rt2870sta /sbin/modprobe --ignore-install rt2870sta $CMDLINE_OPTS; /bin/echo "0b05 1784" > /sys/bus/usb/drivers/rt2870/new_id`
Reboot!

Simple enough. What can I say, I love the Ubuntu community! Mad propz go out to chili555 and his post over here: [http://ubuntuforums.org/showpost.php?p=9445731&postcount=58][2]

   [1]: http://excid3.com/blog/wp-includes/images/smilies/icon_razz.gif
   [2]: http://ubuntuforums.org/showpost.php?p=9445731&postcount=58
