---
title: 'Rails Tip #5: Rails Time Select Like Google Calendar'
author: excid3
layout: post
dsq_thread_id:
  - 513579256
categories:
  - General
---
Something that has always bothered me is the way we input dates and times on the web. It’s still not pretty yet. It’s bad. jQuery plugins and large calendar might be alright for dates, but times? They still suck horribly.

Look at what Rails gives us by default for a date and time selector:

![][1]

That is just nasty. It’s a 24 hour time selector and separated into separate fields. The iPhone/iPad have a nice little spinner, but that’s only useful if you have a touch screen. Google Calendar’s time picker so far has been my favorite. I wanted to emulate that and found a nice little [library][2] that did what I wanted.

It’s not a magical solution, but it works well enough:

![][3]

Awesome! But then I realized, nobody really maintained this anymore. And on top of that, there was no good solution for using the value returned. It’s not in the params name that works well the built-in Rails form.

### Announcing combined_time_select

I spent some time on this because a combined time select field is something I want to use quite often. The following is an example of how you would use the gem in both the view and the controller. It works cleanly with the date_select field on the same attribute.

The parse_time_select converts the params into a Time object so that we can assign it to an attribute easily. It is, of course, not required if you would like to do the time parsing yourself.

Check out `combined_time_select` on Github: [github.com/excid3/combined_time_select][4]

Or install it with Bundler:


      gem "combined_time_select", "~> 0.0.1"


If you have any questions, comments, or ideas let me know!

   [1]: http://f.cl.ly/items/3E0g35362y032j1U2b3k/Screen%20Shot%202011-12-23%20at%2012.16.23%20AM.png (datetime_select)
   [2]: https://github.com/tamoyal/simple_time_select
   [3]: http://f.cl.ly/items/1945331M3W1h0f1K3I2v/Screen%20Shot%202011-12-23%20at%2012.08.37%20AM.png (time_select)
   [4]: https://github.com/excid3/combined_time_select
