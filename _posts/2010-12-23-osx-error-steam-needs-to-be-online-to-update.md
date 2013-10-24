---
title: 'OSX Error: steam needs to be online to update.'
author: excid3
layout: post
dsq_thread_id:
  - 196911483
categories:
  - OSX
tags:
  - braid
  - humble indie bundle
  - online
  - osx
  - steam
---
After excitedly picking up the Humble Indie Bundle 2 and finding out I got the original bundle AND they were Steam activatable, I was pretty stoked to install Steam and get started wasting away in the comfort of my computer chair as the sun set.

Just install steam and activate the games? Yeah right. I might as well have called Steam up to have them mail me a CD with the install files, my internet connection is terribly slow. Of course, I patiently download the installer, grab the updates and … what? Oh right, the updates get so far, restart, and then fail.

> Steam needs to be online to update. Please confirm your network connection and try again.

Wat.

I’m online, it’s working fine, maybe it just timed out or something? I try this like 6 times. No dice. ![:|][1]

Back to the drawing board. I found a forum post that mentioned checking the Console.app for errors. Sure enough, it’s failing to download files. That’s weird.

Simple fix? Eh, it’s not too bad. Check your Console.app for the failing downloads, copy paste into your browser, download the files. Open up Applications Folder, Right click on Steam, click Show Package Contents, and paste the files Steam couldn’t get into the Contents/MacOS/package folder and try again.

The files I needed were the following if it might help anyone:
[public_all.zip.bdf97deae1c4a1de274011b11e0ac9f8336e1b6d][2]
[webkit_osx.zip.98b47456b0de2d7e7f234f10649087f51cb53f1d][3]
[bins_osx.zip.c142c18f1d54fa969d0f8dc50e6956560ffd9a25][4]

Steam still had to grab 2MB of updates, but those seemed to work for some reason. This is on OSX 10.6.5 and I haven’t done anything weird with my installation. Don’t know what’s causing it, but whatever. This fixes it and now I get to forget about my bodily functions while I traverse time playing Braid until the wee hours of the morning…

   [1]: http://excid3.com/blog/wp-includes/images/smilies/icon_neutral.gif
   [2]: http://cdn.store.steampowered.com/public/client/public_all.zip.bdf97deae1c4a1de274011b11e0ac9f8336e1b6d
   [3]: http://cdn.store.steampowered.com/public/client/webkit_osx.zip.98b47456b0de2d7e7f234f10649087f51cb53f1d
   [4]: http://cdn.store.steampowered.com/public/client/bins_osx.zip.c142c18f1d54fa969d0f8dc50e6956560ffd9a25
