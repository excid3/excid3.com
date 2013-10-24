---
title: NTDETECT Failed
author: excid3
layout: post
aktt_notify_twitter:
  - yes
dsq_thread_id:
  - 55195808
categories:
  - News
tags:
  - failed
  - ntdetect
  - windows
  - xp
---
Yesterday I was fixing a computer for someone and the symptoms were simple: The computer restarts just after the bios in a continuous loop. At first I had trouble booting a livecd but after a while I got that working as well, the hard drive tested fine through several diagnostics and so did the memory. Probably not a hardware issue, but the lights on the motherboard indicated an “Other error”, often meaning a motherboard failure or hard drive failure from what I had found on the internet. Hoping it wasn’t a hardware issue, I was able to get the machine to boot into another IDE hard drive that had Ubuntu installed on it, and I was also able to browse the drive through that install and LiveCD’s as well.

This made it seem like its a software issue on the drive. Sure enough, after plenty of googling, I came across an MSDN article that SP3 possibly can through your machine into a continuous reboot loop with a bad configuration of Windows. One thing I hadn’t tried yet was safemode. The reboots were so quick after the POST and bios displayed that I did not think it would even make it into safe mode. Sure enough I was able to make it in, but every option I selected would reboot the computer immediately with an NTDETECT Failed message up for a second. At least I had an error to work with finally. This same issue preventing safe mode from running must mean that it’s the same reason the regular boot will not complete. Googling that brought me across this [post][1]:

> COPY X:\i386\NTLDR C\:
COPY X:\i386\NTDETECT.COM C:\
where X is the drive letter for your CD drive.
Remove the CD and type exit.
Reboot your machine and see if that has fixed the problem.

Doing all that from the XP Repair console on an XP SP3 disc I had did the trick. It appears that the machine had NTDETECT.COM deleted during a Windows update. No error messages made it hard to diagnose, it could have been a hardware or software issue, luckily safe mode was working enough to display an error.

So if anything is taken from this article, it’s “Use Linux.” You don’t have stupid issues like this and you certainly don’t get reboots without error messages just because your operating system is trying to hide its internal defects. Get a real OS. Get Linux.

   [1]: http://www.techsupportforum.com/microsoft-support/windows-xp-support/149634-ntdetect-failed-resolved.html#post855982
