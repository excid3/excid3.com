---
title: Building an API vs Building an Application
author: excid3
layout: post
aktt_notify_twitter:
  - yes
  - yes
aktt_tweeted:
  - 1
dsq_thread_id:
  - 126506419
categories:
  - General
tags:
  - API
  - application
  - design
  - error trapping
---
Going through school, you are taught one thing. How to build small applications with limited input and limited output. This is fine and dandy, and it allows the professors to assign projects to teach a specific topic by example and move on quickly. What they don’t get into is designing full fledged applications and the APIs that those applications might wish to make public.

On one hand you could simply build a plugin loader that would execute a plugin’s initialization to add hooks into the app easy enough. This is what I tried with Keryx 0.92. It was a horrible idea. You’re stuck with having plugins directly manipulate the variables inside of the host app. This is such a horrible idea for many reasons.

For the rest of this article, keep in mind that I reference API calls typically, but this doesn’t only apply to web application APIs, this applies to any library you are building. I learned a lot of this building [Unwrapt][1] for [Keryx’s][2] backend. My goal was to build a frontend agnostic library that was capable of working in many differnet applications that may not necessarily be Keryx’s GUI or CLI frontends. We have planned on building Keryx into a web based application which could be another frontend similar to [packages.ubuntu.com][3]. Honestly the sky is the limit when you are building an API or library. You’re making a general use case tool, so treat it as such. Millions of applications you would have never thought of, so don’t think you are smarter than the people who will be using your library. You’re building it so it is always going to be hard for you to see it from a different use case angle than someone who just read your README looking for a specific tool for their creative new idea.

What you really want is to build a thoughtful list of API calls that return the data and do the manipulations behind the scenes and simply return the results. This would be similar to a builtin class or data structure like a Python dictionary. We don’t care how it is implemented, we just know that these functions do as they say properly, and that’s all we want.

This approach differs significantly in several areas:

  1. #### Error trapping

You don’t want to error trap in an API. What? You’re just going to cause havoc and force the other app to deal with it all? Yes, to some extent. You need ot trap the errors that the programmer using your API shouldn’t have to worry about it. These are going to be errors the programmer got because they were using your API wrong. What you need to do as an API designer is to error trap your API, but return custom **helpful** errors to them. Explain what went wrong in the error you return and maybe even suggest the proper input so they can get the expected output. This differs from standard application programing when you basically just want errors to fail silently unless they are fatal.

  2. #### Naming schemes

Spend a lot of time thinking about your API call names. Make sure you have everything before you publish. Changing your API is a **very** bad idea. It causes all the applications using your API to break. Do this more than once or twice and your API users are going to get pissed, especially if you don’t notify them far enough ahead of time. When their application breaks because of changes you made, no matter how well intentioned the changes were, you are going to have unhappy users. Keep this thoughtful, discuss with customers and users if you need to. Make sure you do it right the first time around. Content users are the kind of users you want. Solid naming schemes that don’t change also mean that refactoring the backend to work in a completely different manner is silent to the end user. No one using your API knows any better, they just realize that hey, everything is so much faster all of a sudden! This saves everyone from having a lot of headaches in the future.

  3. #### Maintenance

Make sure your API is rock solid. You’re having people rely on your code for their application. You need to do thorough testing in order to create a solid API. This goes closely with “Naming schemes” and should almost be considered the same topic. Any interruptions in service, the developer using your API is not always going to be able to view your source code (if you are a company) nor will they always want to dig through your API or library to fix **your** bugs. You’re building a service for others, make sure it works for them.

I’m sure there are more things that I should mention, but hey, I’m still learning too. These are a few of the things I’ve learned on my own that I feel should be taught in universities who are producing students that are expected to excel in their fields of study upon graduation. You can’t do it without learning on your own, so get out there and teach yourself something!

   [1]: http://github.com/excid3/unwrapt
   [2]: http://keryxproject.org
   [3]: http://packages.ubuntu.com
