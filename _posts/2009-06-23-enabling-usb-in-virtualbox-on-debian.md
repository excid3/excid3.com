---
title: Enabling USB in Virtualbox on Debian
author: excid3
layout: post
dsq_thread_id:
  - 55195790
categories:
  - Debian
---
Trying to get my USB modem to run in Virtualbox turned out to be more trouble than I suspected. The reason? All the USB devices were grayed out when I went to give the Guest OS the modem. With a bit of Googling I came across the answer.

First, the user must be part of the vboxusers group. You can check this quickly by running `cat /etc/group | grep vboxusers` and checking to see that your user is in the last section of the resulting string. Here is what mine looked like:

> `chris@chris-desktop:~$ cat /etc/group | grep vboxusers
vboxusers:x:116:chris`

Take note of the 116 here. This is the group id number or gid. We need this to enable usb for that group. For Debian, virtual filesystems (which usb is) is taken care of in `/etc/init.d/mountkernfs.sh` so we are going to need to edit this file:

> `
chris@chris-desktop:~$ su
Password:
chris-desktop:/home/chris# nano /etc/init.d/mountkernfs.sh
`

Now you’re going to want to go down and find a line that looks like this: `domount usbfs usbdevfs /proc/bus/usb usbfs -onodev,noexec,nosuid`. All we need to do is to append 2 options to this line: `devgid=116,devmode=664`. This allows us as members of `vboxusers` to mount usbfs/usbdevfs inside Virtualbox. Your line should look similar to the following with `116` replaced with the id number of your `vboxusers` group:

> `domount usbfs usbdevfs /proc/bus/usb usbfs -onodev,noexec,nosuid,devgid=116,devmode=664
`

There you have it! Give your Debian box a quick reboot and you’re set.