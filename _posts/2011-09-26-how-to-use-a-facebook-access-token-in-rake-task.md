---
title: How To Use A Facebook Access Token In Rake Task
author: excid3
layout: post
dsq_thread_id:
  - 426301790
categories:
  - News
---
Recently I was working on a Rake task that was going to cache updates from Facebook locally. Of course, the permission for what I was doing meant that I needed an `access_token` to access the Graph API. This is definitely beneficial if you’re wanting to create a cron job or rake task that hits the API periodically.

The access_token you get normally only works while you’re logged in. That doesn’t do you much good in a Rake task. Oh yeah, and the docs don’t do much good either. 14 gray hairs later, I had a working solution that works pretty well.

In order to obtain a “permanent” access_token you need to request permission for `offline_access` along with any of the permissions you need normally. You’ll also need to setup a Facebook app so that you can use the API key and secret to obtain said token.

Once you’ve got that information it’s pretty simple steps to get what you need. I just fired up a local Rails app so that I could retrieve the postbacks from Facebook OAuth.

First you navigate to this url, replacing it with your API key:


    https://graph.facebook.com/oauth/authorize?client_id=YOUR_API_KEY_GOES_HERE&redirect_uri=http://localhost:3000/&scope=read_insights,offline_access

That will make a request to localhost:3000 with a code parameter. Then you visit the following url that contains this code and your api key and secrets.


    https://graph.facebook.com/oauth/access_token?client_id=YOUR_API_KEY_GOES_HERE&client_secret=YOUR_API_SECRET_KEY&redirect_uri=http://localhost:3000/&code=THE_CODE_WE_JUST_GOT

And voila, you should get back an `access_token`. Just save this key and use it in your rake tasks! If you know of a better method of doing this let me know, it certainly doesn’t seem optimum, but it does the trick for now.