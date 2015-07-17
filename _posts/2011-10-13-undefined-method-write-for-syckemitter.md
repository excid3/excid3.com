---
title: 'Undefined Method &#8216;write&#8217; for Syck::Emitter'
author: excid3
layout: post
dsq_thread_id:
  - 442403070
categories:
  - Rails
---
Yaml is awesome. One of the ruby parsers Yaml is named Syck. It’s awesome, but most of the time you’re not dealing with it directly. You install a gem and get an error regarding Syck, but its just a dependency of one of the gems.

In my case it was:


    NoMethodError: undefined method `write' for #

The quick solution to this is to set your RUBYOPT environment variable:


    RUBYOPT='-rpsych' bundle install


The reason behind this is that YAML automatically uses the older Syck library unless Psych is loaded before YAML.