---
title: Making Omnisocial Rails 3.1 Compatible
author: excid3
layout: post
dsq_thread_id:
  - 374281867
categories:
  - Hacking
  - Rails
tags:
  - 3.1
  - authentication
  - devise
  - facebook
  - omniauth
  - omnisocial
  - rails
  - twitter
---
Rails 3.1 final is just around the corner. As I’m eagerly awaiting the release of this version, I’ve begun writing a lot new Rails projects in 3.1. The problem with this is that quite a few libraries are only really built for Rails 3.0 at the very latest.

Tonight I wanted to try Omnisocial. I know that Omniauth isn’t that hard to setup on its own, but hey, might as well try new things right? Well, I ran into some problems. After setting up the Omnisocial gem in my Gemfile I fired away at `bundle install` but ran into this problem:


    omnisocial depends on multi_json (~>0.0.2)

Nice. Something in Rails 3.1 was conflicting with the version of multi_json that one of the Omnisocial dependencies. [That fix][1] was easy enough.

Now, Omnisocial works, but login with twitter no longer works. After some fiddling, I came to the conclusion that it wasn’t a problem with my configuration, or at least not likely.

I came across an issue on Github for Omniauth (Unforunately I don’t remember which one). A bunch of people were also having failed logins with Omniauth as well. It certainly didn’t seem to be a standalone issue with Omnisocial at this point. One of the comments mentioned that `rack.auth` had been changed to `omniauth.auth` and then it clicked. This was the reason, it was probably just getting a nil instead of throwing an exception and causing everything to fail. Sure enough, that’s what it was.

While we wait to get the official Omnisocial repo updated, you can go ahead and use [my version][2].

Updating libraries to Rails 3.1 compatibility is fun, important, and lots of people will thank you for doing so. It’s a great way to learn. If you have a plugin that you need help converting, let me know! I’d love to help.

   [1]: https://github.com/excid3/omnisocial/commit/fbc9fe00d1dd41bc3d7896caf506b5841ddc7450
   [2]: https://github.com/excid3/omnisocial
