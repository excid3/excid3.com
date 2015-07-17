---
title: Asus M4N78 Motherboard USB Issue
author: excid3
layout: post
dsq_thread_id:
  - 55195797
categories:
  - Debian
tags:
  - asus
  - m3n78
  - m4n78
  - motherboard
  - stops working
  - usb
---
About 2 months ago I purchased parts for building my own desktop. The goal was to build a powerful desktop workstation for $500 while keeping in mind that this box will become a server in the next couple of years. Dedicated graphics was an unnecessary expense for such a machine. All I need is to power dual monitors smoothly so decent onboard graphics card saved me money there. Turns out this was not a great idea in the long run.

I purchased the [Asus M4N78][1] motherboard with an onboard Nvidia 8300 from newegg. Everything seemed great. Installed Windows, everything is fine. Installed Ubuntu, everything was fine…for a while. After some time, I noticed that my USB mouse would lock up after random periods of time, often when something mildly video intensive was running, VLC for example. The mouse would stop working and lose power, all other USB devices kept working however unplugging them and replugging them in also stopped receiving power.

After some searching I came across [this thread][2]t on the Ubuntu Forums. A [bug][3] had been filed to Ubuntu back in Jaunty Beta discussing the issue as well. No one seemed to have any idea. It seemed graphics related and yet, it wasn’t the graphics driver. It took a good several weeks before anyone found an answer. I’d like to give a BIG thanks to [Chemical Imbalance][4] for coming across [this thread][5] that had the answer we were looking for this entire time.

Basically the issue is with the [interrupts ][6]on the motherboard. This affects the M3N78 PRO and M4N78 PRO motherboards as well as probably others. Simply put, one of the USB ports is sharing an interrupt with the onboard graphics card. It is not strictly an Debian or Ubuntu issue (the two OS’s that have problems with it the most) as in Windows XP, I have experienced a blue screen of death caused by the USBHUB.SYS module. This was one of the first tip offs to me that the issue was hardware related and not OS specific. It has only happend the once in Windows, but the fact that it did happen is very meaningful in finding the cause of the issue.

The fix? Just move the mouse to another USB port. You can check which interrupt your nvidia card is using with `cat /proc/interrupts` in Linux. Take note of the usb hub that is sharing the interface and compare it with the device that is running on the same one that you find in `lsusb`. For me the top leftmost port was the one causing the problems.

Hope that helps someone! It took so much time to debug and figure out the cause that I don’t want anyone to have to go through that again. Another fix is to just install a dedicated graphics card. That may be an option for the future, but when you’re on a budget, you’ve got to make things count whenever you can.

   [1]: http://www.newegg.com/Product/Product.aspx?Item=N82E16813131382
   [2]: http://ubuntuforums.org/showthread.php?t=1147699
   [3]: https://bugs.launchpad.net/ubuntu/%20bug/350065
   [4]: http://ubuntuforums.org/member.php?u=786669
   [5]: http://www.nvnews.net/vbulletin/showthread.php?t=123583&page=3
   [6]: http://en.wikipedia.org/wiki/Interrupt
