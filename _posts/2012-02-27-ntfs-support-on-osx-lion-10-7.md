---
title: NTFS Support On OSX Lion 10.7
author: excid3
layout: post
dsq_thread_id:
  - 591110577
categories:
  - General
---
Today I was about to backup some files to my external drive, I realized I hadn’t installed anything to allow writing to NTFS on OSX Lion yet. After [researching the problem][1], it’s relatively easy, but not entirely perfect.

## Install OSXFUSE

Hop on over to the new successor to MacFUSE and grab the download here: . I installed this including the MacFUSE compatibility option.

## Install NTFS-3G

The free NTFS-3G we need to install next. You can grab that **[here**][2].

It looks like this has been defunct for a while, but there is a [paid version][3] that is replacing it.

## Reboot!

Your drive should now be writable. You may find that you are getting this timeout error:

![][4]

This shouldn’t cause any problems, but if you would like, you can install this fix:  based on the code here: 

Everything seems to be working splendidly after that. It’s a little more trouble than you’d imagine it should be, but all in all, not too bad.

[Source][1]

   [1]: http://blog.nolar.info/ntfs-3g-in-mac-os-x-lion-10-7-with-read-write-support/
   [2]: http://sourceforge.net/projects/catacombae/files/NTFS-3G%20for%20Mac%20OS%20X/2010.10.2/
   [3]: http://www.tuxera.com/products/tuxera-ntfs-for-mac/
   [4]: http://excid3.com/blog/wp-content/uploads/2012/02/ntfs-3g-15seconds-signal-error.png (ntfs-3g-15seconds-signal-error)
