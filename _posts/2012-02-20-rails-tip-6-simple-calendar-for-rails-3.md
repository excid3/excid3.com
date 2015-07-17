---
title: 'Rails Tip #6: Simple Calendar For Rails 3'
author: excid3
layout: post
dsq_thread_id:
  - 583070234
categories:
  - Rails
---
Calendar gems for Rails are known for being kind of ridiculous. They’re typically messy and/or bundled with a whole bunch of css and js that you don’t really need or want. If you do, you’re probably going to want to roll your own anyways.

## Announcing `simple_calendar`

Using `simple_calendar` is easy. You simply query for your items in the controller as normal:


      def calendar
        @events = Event.all
      end

And then in the view (for example: `app/views/main/calendar.html.erb`) you can display them in a calendar:


    






You can also add the following line to your css to guarantee that dates in the calendar have the same height and widths:


      .calendar td { height: 100px; width: 14.28%; }

And voila! You’re ready to go. If you toss up Twitter Bootstrap on the site, you can get a slick looking calendar in a matter of minutes:

![][1]

## In Progress

This gem is definitely just getting started. There are lots of future additions I’d like to add, and I’m sure people have great ideas for things I can add as well.

You can find `simple_calendar` here: 

Be sure to discuss ideas in the comments!

   [1]: http://cl.ly/3d152G2r3U0p1o2y3I2v/Screen%20Shot%202012-02-19%20at%209.31.20%20PM.png
