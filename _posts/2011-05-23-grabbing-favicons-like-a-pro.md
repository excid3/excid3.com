---
title: Grabbing Favicons Like A Pro
author: excid3
layout: post
dsq_thread_id:
  - 311555844
categories:
  - General
  - Rails
tags:
  - favicon
  - google
  - rails
---
As I was deploying a Rails application today I realized I had forgotten the Favicon! Now now, before you start proclaiming that I’m a horrible developer and plastering my photo on a WANTED poster, let’s go through an awesome way to grab a Favicon from a domain.

The site is hosted on SIUe’s domain and I wanted to use the same favicon as they do. Well, it wasn’t easily grabbable from source or by just probing the domain for the filename. Go figure.

So how do we grab the favicon? Thanks to Google being awesome, it’s not hard. I just opened up a terminal and navigated to my Rails application’s public directory and ran this:


    curl http://www.google.com/s2/u/0/favicons?domain=siue.edu > favicon.ico


Bam! You’re done. You should now have a copy of the favicon from any domain you want save to a file on your hdd. Replace siue.edu at the end of the url with the domain you need and you’re good to go!