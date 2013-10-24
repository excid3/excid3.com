---
title: Use Rake Seamlessly Rails 3.0 and 3.1
author: excid3
layout: post
dsq_thread_id:
  - 419314643
categories:
  - News
---
If you’ve been using Rails 3.0 and 3.1 recently, you’ll notice that the changes in Rake 0.9.2 are incompatible. Without a doubt, you’ll run into this error at least once a day:


    You have already activated rake 0.9.2, but your Gemfile requires rake 0.8.7. Consider using bundle exec.

Incredibly annoying right? Instead of removing rake 0.9.2 like most people suggest, try this solution instead:


    alias rake='bundle exec rake'

You’ll need bundler and a Gemfile in your project (there are cases where you might be using a project that doesn’t, like [janus][1]). If you don’t have one you’ll get the following error:


    Could not locate Gemfile

That’s not a big deal though. If you want to run simply “rake” and not “bundle exec rake” like we just aliased it to you can do run this:


    `which rake`

The back ticks will execute the command in a subshell and execute it’s results. If you’re like me, the amount of times you want to run rake without a Gemfile is fairly uncommon so this makes things a lot simpler on a regular basis.

   [1]: https://github.com/carlhuda/janus
