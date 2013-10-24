---
title: Fun with the Github API and Yaml!
author: excid3
layout: post
dsq_thread_id:
  - 157930371
categories:
  - General
tags:
  - API
  - awesome
  - git
  - github
  - rails
  - ruby
  - yaml
---
Alright, so it’s not so much “fun” as learning how to use it. First off, we have the site we all know and love, [Github][1]. My projects page has become increasingly out of date and I wanted a way to keep this updated, as well as showing statuses for the current projects. If I haven’t touched the project in a long time (say 4 months) it’s probably on hold.

My idea was to aggregate this into a rails app using the Github API and that’s exactly how  came about.

Now the Github API is very simple to use. It’s just a simple url that you append your username to and it returns you some YAML based on your request. Simple right? Yeah, pretty much.


    list = Net::HTTP.get URI.parse('http://github.com/api/v2/yaml/repos/show/excid3')
    @repos = YAML::load(list)["repositories"].sort { |a, b| a[:pushed_at]  b[:pushed_at] }


These two lines grab the content from the Github API, parse it into YAML, and sort the repositories to an array of “most recently pushed” repositories. You can iterate through them now putting them into a list like the github page has for your username now!

Checkout  if you are interested in reading more of the source how the current projects list works. ![:-\)][2]

   [1]: http://github.com
   [2]: http://excid3.com/blog/wp-includes/images/smilies/icon_smile.gif
