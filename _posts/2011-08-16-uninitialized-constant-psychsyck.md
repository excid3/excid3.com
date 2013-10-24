---
title: uninitialized constant Psych::Syck
author: excid3
layout: post
dsq_thread_id:
  - 388146248
image:
  - 
embed:
  - This is the default text
seo_follow:
  - 'false'
seo_noindex:
  - 'false'
categories:
  - News
---
As I was reading up on RSpec and Cucumber this evening I went to install cucumber and ran into this:


    ERROR: While executing gem ... (NameError)
    uninitialized constant Psych::Syck

Awesome. Googling it was to little avail, everyone was primarily having this issue after installation, not during or before like I was. As it turns out, there has been a change in how the Yaml was being parsed. I updated all my gems and still had the issue, so I figured it might be due to rubygems itself.

The solution was this:


    gem update --system

This bug describes the issue a bit more: [http://rubyforge.org/tracker/index.php?func=detail&aid=29163&group_id=126&atid=575][1]

   [1]: http://rubyforge.org/tracker/index.php?func=detail&aid=29163&group_id=126&atid=575
