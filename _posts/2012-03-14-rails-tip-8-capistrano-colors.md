---
title: 'Rails Tip #8: Capistrano Colors'
author: excid3
layout: post
dsq_thread_id:
  - 610906975
categories:
  - General
---
If you’ve used Capistrano before, you’re familiar with the large error logs. Finding errors is, well, a hassle. You’ve got a whole slew of text, some just saying what command it’s going to execute next, sometimes errors, sometimes just output from Bundler or whatever it’s running.

## Wouldn’t it be nice if we could colorize Capistrano?

And you can! Just install the `capistrano_colors` gem on your local machine and we’ll set it up to run on every capistrano deployment without having to modify your existing deploy scripts.


      gem install capistrano_colors


And next, we add a configuration to your `~/.caprc` file:


    require 'capistrano_colors'

    capistrano_color_matchers = [
      { :match => /command finished/,       :color => :hide,      :prio => 10 },
      { :match => /executing command/,      :color => :blue,      :prio => 10, :attribute => :underscore },
      { :match => /^transaction: commit$/,  :color => :magenta,   :prio => 10, :attribute => :blink },
      { :match => /git/,                    :color => :white,     :prio => 20, :attribute => :reverse },
    ]

    colorize( capistrano_color_matchers )


And that’s as simple as it is! When you’re done your output should look something like this:

![capistrano colors][1]

**This a must have if you’re using Capistrano for deployments.** Check out the source here: 

Got any other awesome deployment tips? Share them with me in the comments!

   [1]: http://cl.ly/3a0g0a2h2c0o2i3L3k1W/Screen%20Shot%202012-03-13%20at%2010.31.19%20PM.png
