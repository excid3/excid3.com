---
title: 'undefined local variable or method `version_requirements&#8217; for #<Rails::GemDependency> (NameError)'
author: excid3
layout: post
dsq_thread_id:
  - 232144745
categories:
  - Rails
tags:
  - error
  - rails
  - ruby
  - rubygems
---
So I upgraded to the latest rubygems the other day…only to be presented with this wonderful little error!


    undefined local variable or method `version_requirements' for # (NameError)


I thankfully came across [this comment][1] on a gist on github of someone having the same error.

The solution is fairly simple. Just run the following commands to go back to the previous version of rubygems and you should be fine:


    $ gem install rubygems-update -v='1.4.2'
    $ gem uninstall rubygems-update -v='1.5.0'
    $ update_rubygems


That simple revert seems to fix any issue I have with running Rails 2.3 applications. If anyone knows more about the issue and how we can fix it to use rubygems 1.5.x with Rails 2.3 that would be great!

   [1]: https://gist.github.com/807008#gistcomment-20117
