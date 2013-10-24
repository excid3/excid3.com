---
title: Fixing Urlgrabber Progress Meter
author: excid3
layout: post
dsq_thread_id:
  - 55195831
categories:
  - Python
tags:
  - progress
  - Python
  - textmeter
  - urlgrabber
---
Urlgrabber provides some much needed functionality to the urllib module in Python. It’s excellent support for resume and other functionality makes it extremely easy, however I’ve run across an inconsistency in the urlopen function that skips printing the final result of the download. After familiarizing myself with the internals, it took quite a bit of time to actually track down the code. It worked perfectly fine with urlgrab and so I was unsure of what might be causing it, I finally got a hold what was missing. A call to the end() function of the text progress function was missing after the file had successfully completed. See: . Since urlgrabber has not been updated since 2006, I have uploaded my changes to a branch on github for anyone interested. ![:\)][1]

**Fork me: **

**Urlgrabber Home: **

   [1]: http://excid3.com/blog/wp-includes/images/smilies/icon_smile.gif
