---
title: Python downloading and resuming with text progress using urllib
author: excid3
layout: post
aktt_notify_twitter:
  - yes
dsq_thread_id:
  - 78130000
categories:
  - Python
tags:
  - download
  - progress
  - Python
  - resume
  - text
  - urlgrabber
  - urllib
---
So recently I have been working on download scripts for Keryx once again. Building a script to do this seemed over my head at first. The plethora of classes and functions was a little daunting at first, but realizing how to use them after reading some examples wasn’t so bad. Urlgrabber seems to do the trick, but I have run into some issues. Why not rewrite it from scratch and learn something along the way?

I had two goals in mind. #1 was providing resume support. This is the most important thing we have been missing in Keryx for a while. We were able to do it with urlgrabber but I did not feel like wading through all the code to learn how it worked and make changes. #2 was file progess. This proved to be a problem with urlgrabber such that some of the output would overlap or be skewed improperly.

In the end, this is what I came up with. It’s essentially a modified version of this code example: 

I cleaned up some of the variable names to make things a little clearer and even though it is still quite ugly. Beautification is for another night though.