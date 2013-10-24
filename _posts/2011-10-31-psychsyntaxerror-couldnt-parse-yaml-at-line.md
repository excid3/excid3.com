---
title: 'Psych::SyntaxError: couldn&#8217;t parse YAML at line'
author: excid3
layout: post
dsq_thread_id:
  - 487865307
categories:
  - News
---
Working today I ran into an interesting bug. I was using the [Zencoder][1] gem to work with their API (I’d protect in the prison showers good) and ran into this error


    Psych::SyntaxError: couldn't parse YAML at line 1 column 37

What was odd is that this error came from a JSON parsing line of code inside the zencoder gem. I’m still not 100% sure why the ActiveSupport::JSON.decode call uses a YAML parser but I’m sure I’ll find out later.

So anyways, back to getting your crap running again. From what I [gathered][2], the JSON being returned likely included a special character that Psych freaks out on.

Ruby has a couple YAML parsers, and typically uses Psych. The link above mentions that putting the special characters in double quotes fixes that error for him. In my case, I wasn’t controlling the JSON so that solution was out the window.

The fix for this is to use a different YAML interpreter like so in your `config/boot.rb` if you are using Rails, or anywhere at the beginning of your ruby project:


    require 'yaml'
    YAML::ENGINE.yamler = 'syck'

   [1]: http://zencoder.com
   [2]: http://blog.modsaid.com/2011/03/rails-3-couldnt-parse-yaml-error.html
