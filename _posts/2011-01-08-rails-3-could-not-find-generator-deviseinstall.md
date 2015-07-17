---
title: 'Rails 3: Could Not Find Generator devise:install'
author: excid3
layout: post
dsq_thread_id:
  - 205495270
categories:
  - Rails
tags:
  - bundler
  - devise
  - gem
  - rails
---
Something I keep forgetting about, is how Rails 3 treats gems. Any gem you want to use (in this case it was devise) needs to be setup in the Gemfile.

If you try to run Devise’s installation: `rails generate devise:install` you’ll get `Could not find generator devise:install`.

What happens is rails doesn’t detect that the devise gem is needed, and therefore doesn’t load it. All you’ve got to do is open the Gemfile for your project and add the following line, where the gem version matches what you are currently using:


    gem 'devise', '1.4.7'

Run the installation command again and you should be good to go!