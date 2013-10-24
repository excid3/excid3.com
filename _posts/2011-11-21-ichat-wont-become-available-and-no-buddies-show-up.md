---
title: 'iChat Won&#8217;t Become Available and No Buddies Show Up'
author: excid3
layout: post
dsq_thread_id:
  - 487865263
categories:
  - General
---
We use iChat a lot here at work. It’s nice for screen sharing and audio/video chat. The problem with it is that sometimes you’ll sign on and it just won’t work. You either can’t set your status to available or you don’t have any buddies listed. It’s annoying to say the least.

The solution for this is to open up Activity Monitor and quit the `imagent` process like so:

![Activity Monitor][1]

Then you should be able to restart iChat and be good to go. This seems to stem from sleeping OSX often. So maybe you should just do a full shutdown at the end of the work day once in a while. ![:P][2]

   [1]: http://f.cl.ly/items/2H1I3m2z1k0P1x2e0Y3Q/Screen%20Shot%202011-11-21%20at%202.41.42%20PM.png
   [2]: http://excid3.com/blog/wp-includes/images/smilies/icon_razz.gif
