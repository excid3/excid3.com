---
title: Setting Up PhoneGap
author: excid3
layout: post
aktt_notify_twitter:
  - yes
aktt_tweeted:
  - 1
dsq_thread_id:
  - 103762060
categories:
  - Android
tags:
  - Android
  - eclipse
  - java
  - phonegap
---
So today I got the chance finally to play around with installing PhoneGap. Should be easy right? Not quite. The tools for Java on Windows really don’t have a good configuration when you install them and you end up messing with environment variables and things until it just happens to work. So let me go through a little bit of what I did in order to get it setup.

I started out by using [this tutorial][1]. Everything seems to work reasonably well however a few things were left out. Essentially you want to extract the SDK and ANT to C: so that you have C:android-sdk-windows and C:apache-ant-1.8.1 (just the version I was using, you should modify it to match yours). There is no default install location for these so its best to put them in the root of C for easy access or in the Program Files directory. Your choice, just remember where you put them. You need to add these to your PATH environment variable like they mention by going to My Computer -> Properties -> Advanced -> Environment Variables which might differ depending on your Windows installation. Now my JDK didn’t setup the JAVA_HOME directory so I didn’t have a clue what was really happening when it failed to build. Essentially the PhoneGap jar fails to build which then fails to create your droidgap project when you are trying to create a new project. This is poor design on the script since it should quit when it doesn’t find the file but oh well that’s another story. So what I needed to do was to create a new Environment Variable named JAVA_HOME and set it to “C:Program Files (x86)Javajdk1.6.0_20″ Saving this an opening up a fresh command line should let you smoothly go through and build the jar which then creates the project properly using droidgap.

The next problem I ran into was the default.properties file in the framework folder was set to using android-8 which was an unavailable target on my machine. Like the tutorial mentioned, I changed it to android-7 and everything seemed to work alright afterwards.

Hopefully those fixes help. It is always a mess working with libraries strewn all over the place especially when they expect environment variables to be created. Why we can’t develop proper installers for these libraries is beyond me…

   [1]: http://phonegap.pbworks.com/Getting-started-with-Android-PhoneGap-in-Eclipse
