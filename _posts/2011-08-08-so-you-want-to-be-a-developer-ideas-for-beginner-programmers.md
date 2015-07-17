---
title: 'So You Want To Be A Developer &#8211; Ideas For Beginner Programmers'
author: excid3
layout: post
dsq_thread_id:
  - 380390272
categories:
  - General
  - Hacking
tags:
  - beginner
  - developer
  - ideas
  - newbie
  - projects
---
My recent blog post on [ideas for beginner web developers][1] generated a bit of a buzz. It’s interesting to see that so many people want to learn how to program yet don’t know where to start. Some people would assume that if you want to learn how to program you already have something in mind that you want to accomplish. Sometimes that’s right, I always kind of wanted to build a computer game. Other times it’s just because you want to learn a valuable skill. This logic was what brought me to becoming a web developer fulltime.

If your focus is on desktop applications there are many different approaches you can take. You’ll initially want to build command-line applications to get a handle on managing data and manipulating it. As you progress, you’re going to start to want to make this data visible and begin doing user interfaces. After that, integration with web services is always fun.

Here’s an approach that I would recommend to someone starting out as a desktop application developer. Focus on recreating the basic tools you would take for granted in the future. I would suggest doing all of this in a scripting language like Ruby or Python. You will have a considerably harder time learning the concepts in C as you will be learning at a much lower level. If that’s your thing, go for it, the real goal is to work on something you enjoy.

So without further adieu:

  1. Almost every application has configuration settings somewhere, so build a configuration parser from scratch.
  2. It’s pretty imperative that you start simple, so take that configuration parser you just built and make a command line todo list. Load and save the todo items using your config parser.
  3. Now that you’ve got some basic input/output done, let’s sophisticate it a bit and instead save the data to an SQLite database. Lots of desktop applications use these, and it’s just good practice to know how to work with databases anyways. Just use raw SQL statements to write your data.
  4. Let’s take a step back and clean up the database code this time. It’s not really good to write raw SQL. What you typically want to do is create classes in your code that represent objects in the database. This is called an [ORM][2]. Build a basic one of these so that you can set properties on the object and it will automatically update the database without the program needing to understand that it is being saved to an SQL db. Bonus points if you make it support multiple database types.
  5. Now that you’ve gotten your hands dirty with a lot of different backend things, it’s time to put a pretty face on what you’ve built. Check out Cocoa if you’re a Mac user, GTK or Qt if you’re on Linux or Windows. Compare the [GUI toolkit][3] options and figure out what is best for your application. Do you want it to run on any OS? Do you hate how a certain one looks and feels? Experiment, even how writing code for a toolkit feels will have serious effects on how your application turns out.
  6. Very cool, now most applications are becoming web friendly. Nobody wants their data stored on a single machine, they want it everywhere. Look at any of the websites you use on a daily basis, maybe you use Twitter. Instead of using the official Twitter client, try to build your own that works with the Twitter API. Don’t just build it, but actively use it, open source it, try to get your friends using it. You’ll quickly realize that there is a lot to GUI programming, especially the little tweaks that make an experience go from mediocre and annoying to smooth and exhilarating. The most important part is that you use your own software. Things that bug you most certainly will bug other people. Having other people use your software will make things that you overlook come to the forefront so that you become aware of them. Remember that you’re looking through developer’s eyes, not a user’s.

I feel that if you take an approach like this, you get an appreciation for the underlying libraries that most seasoned developers take for granted. Yes they don’t think about the libraries they use too often, but if anything goes wrong they can already have a good understanding of how it works. This is what you want, enough knowledge to be deadly but not too much that it’s overwhelming.

I took this approach with [Keryx][4]. For 4 years, I spent an incredible amount of time trying to build everything from scratch in Python and essentially recreate Synaptic on Ubuntu on my own while simultaneously adding offline support. It’s a huge undertaking and I don’t feel like I ever got it truly finished. At the same time, it has landed me a magazine interview in Linux Journal, humbled me by the incredible heartfelt thank you’s that people have written, and given me huge respect for the community.

This might be just a personal note to myself, but don’t ever become afraid to put your work out there, it is the only way to truly learn. The more you learn, the more you might become afraid that you’re doing seems wrong. It feels like someone might criticize your approach and call your code crappy, but guess what? You built something real and got feedback. If you never showed it to anyone, you’d never know that you could have been doing a better job. Open source your projects on github and get people involved even if it’s just friends. You’ll learn leaps and bounds faster than on your own.

   [1]: http://excid3.com/blog/10-ideas-for-beginner-web-developers/
   [2]: http://en.wikipedia.org/wiki/Object-relational_mapping
   [3]: http://en.wikipedia.org/wiki/Widget_toolkit
   [4]: http://keryxproject.org
