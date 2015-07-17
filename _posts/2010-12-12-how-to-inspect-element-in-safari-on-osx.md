---
title: How to Inspect Element in Safari on OSX
author: excid3
layout: post
dsq_thread_id:
  - 189611226
categories:
  - Rails
tags:
  - css
  - inspect
  - mac
  - osx
  - safari
---
This morning I was doing some testing on [Fluttr][1] and wanted to verify everything was working on Chrome, Firefox, and Safari. Sure enough Chrome and Firefox were fine but Safari was just slightly off. Then I realized, I don’t know how to inspect elements on Safari.

Turns out it’s really simple. Just fire up a terminal, run this command, and then restart Safari.


    defaults write com.apple.Safari WebKitDeveloperExtras -bool true

Then you can Control-Click on an element and there will be an Inspect Element option available. Click that and you’ll get the same dialog you would get using Chrome. Yay!

   [1]: http://fluttr.heroku.com
