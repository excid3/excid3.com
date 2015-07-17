---
title: A Couple Things I Learned At Ruby Midwest 2011
author: excid3
layout: post
dsq_thread_id:
  - 487865105
categories:
  - General
---
This past weekend I attended the [Ruby Midwest][1] conference in Kansas City, MO. This was it’s second year and it’s only gotten better. There were some great talks and a few specific things I wanted to point out.

#### Learn The Ruby Debugger

I’m certainly at fault for this like most developers. Something wrong? My first response is to toss in a `puts` and print out some information. That’s not always doable and you’ll find yourself banging your head against the wall for a while. As it turns out, the Ruby debugger isn’t hard, it’s awesome. Especially when you have tools to combine with it like [Pry][2].

#### Command Line Apps are Awesome

The biggest takeaway here is good output. We have been using Linux for years. Every tool outputs clean, consistent results. Do the same with your Ruby CLI apps. Even if they are rake scripts, make sure each line is one result so that you can use grep and cut to parse the outputs.

#### Confident Code

This was probably my favorite, and I’ve always loved what Avdi Grimm has had to say. His main point here was that we write code that is often unsure of itself. You have if statements everywhere checking for nils. Why? If you know the response will be an array, throw the results into an Array. So what if it’s nil? You’ll get an empty array:


    # Instead of this
    result = SomeApi.request()
    if result.nil?
      do something
    end

    # You can do something cleaner
    result = SomeApi.request().to_a
    # or
    result = Array(SomeApi.request())


This allows you to always be sure that you’ll have an array result that you can iterate over. No need to check for nils. The API is broken returning nils, so if you can’t fix it, use something like the above suggestion to get around that.

#### Notes

There was an incredible amount of good stuff at this conference, most of which I haven’t even begun to touch on. We have a big shared doc of notes from the second day of the conference if you’d like to check them out: 

   [1]: http://rubymidwest.com
   [2]: http://pry.github.com/
