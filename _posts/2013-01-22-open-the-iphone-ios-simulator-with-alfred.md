---
title: Open the iPhone / iOS Simulator with Alfred
author: excid3
layout: post
dsq_thread_id:
  - 1040628653
categories:
  - OSX
---
It’s annoying that, by default with the latest XCode, the iOS Simulator doesn’t automatically get detected by Alfred. The reason is that it’s hidden away inside the XCode app now and you need to add it to the Alfred application search scope. Let’s do that now.

## Open the iPhone / iOS Simulator Directory

The location of the iPhone / iOS Simulator is now:


    /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/

First, you’re going to want to open up Finder to that directory. I just did the following in a Terminal, but you could also `Show Package Contents` on the Xcode.app and navigate to the same directory.

![Open iPhone Simulator Directory][1]

Finder will open up the directory containing the `iOS Simulator.app`

![Applications Directory][2]

## Adding the iPhone / iOS Simulator to Alfred’s Search Scope

Now that you’ve got the folder handy, open up Alfred’s preferences and navigate to the Features > Default Results pane.

![Alfred Preferences][3]

The next step is to drag the `Applications` directory that we just found into the Search Scope box here.

![skitch.png?resizeSmall&width=832][4]

You can see the third line there is the directory we just opened in Finder.

## Yay!

Now you can search for “Simulator” in Alfred and launch the app without Xcode.

![Alfred][5]

   [1]: http://cl.ly/image/0X221u170K2I/Screen%20Shot%202013-01-22%20at%2010.16.17%20AM.png
   [2]: http://cl.ly/image/440Y3k2m0w1x/Screen%20Shot%202013-01-22%20at%2010.35.45%20AM.png
   [3]: http://cl.ly/image/0R1f183T3l0o/Screen%20Shot%202013-01-22%20at%2010.25.54%20AM.png
   [4]: https://www.evernote.com/shard/s20/sh/d3be6da2-2a17-4d5c-8c35-fbd9f3ffe347/4edb1e41f227a99644a8108c971d100c/res/fa2b7592-05ef-4da4-9b5c-78d573dd2727/skitch.png?resizeSmall&width=832
   [5]: http://cl.ly/image/3Q2E2L0v1e3R/Screen%20Shot%202013-01-22%20at%2010.40.54%20AM.png
