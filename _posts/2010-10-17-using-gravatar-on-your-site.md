---
title: Using Gravatar on Your Site!
author: excid3
layout: post
dsq_thread_id:
  - 157864655
categories:
  - General
  - Python
tags:
  - django
  - gravatar
  - Python
  - rails
  - ruby
---
You might have noticed a lot of sites these days are offloading their avatar hosting elsewhere. Where might they be doing this? Probably [Gravatar][1]. The site is run by Automattic who runs WordPress.com. Sites can simply use the email address you registered with to fetch an appropriate sized avatar really easily. Take [my Github ][2]avatar for example: right click on it and open up the image in a new tab. The URL points to Gravatar.com so it’s not actually being hosted on Github at all.

Sounds pretty cool right? Sure is, and it’s extremely easy to get running on your own application. I’m going to be pretty vague about implementations, as you could use this in desktop or mobile applications as well, you’re certainly not limited to using Gravatar with web apps.

The implementation is really quite simple. You generate a link to http://gravatar.com/avatar/WITHYOURMD5HASH?s=48. Your MD5 hash is just the user’s email address hashed using MD5. You can also grab other profile information as well, the “?s=48″ passes in the “s” parameter to Gravatar telling it we want a 48×48 size image. You can use any size from 1px to 512px. For more information on this, check out .

So now that we understand how to grab the proper URL, let’s implement some URL generation in a couple languages. After you’ve got the URL, you can embed it in Django or Rails however you like. If you’re developing a non-web app, you can download the image using the URL instead. Take not here, I’m not testing for invalid inputs, that’s up to you.

**Using Python**


    import hashlib
    def gravatar_url_for(email, size=48)
        hash = hashlib.md5(email).hexdigest()
        return "http://gravatar.com/avatar/%s?s=%i" % (hash, size)

**Using Ruby**


    require 'digest/md5'
    def gravatar_url_for(email, size=48)
      hash = Digest::MD5.hexdigest(email)
      "http://gravatar.com/avatar/#{hash}?s=#{size}"
    end

Simple as that! Now your applications can have nice avatar graphics with hardly any work!

   [1]: http://gravatar.com
   [2]: http://github.com/excid3
