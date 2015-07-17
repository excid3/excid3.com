---
title: Installing Ruby on Rails on Ubuntu 10.04
author: excid3
layout: post
aktt_notify_twitter:
  - yes
aktt_tweeted:
  - 1
dsq_thread_id:
  - 105850828
categories:
  - Ubuntu
tags:
  - rails
  - ruby
  - Ubuntu
---
It’s quite simple. Run these commands in terminal and you are set. The first command is for installing Ruby on Rails while the last ones are for installing the MySQL gem in order to use MySQL. This assumes you have MySQL as Benson pointed out.

`sudo apt-get install build-essential rails`

sudo apt-get install rubygems ruby-dev libmysql-ruby libmysqlclient-dev
sudo gem install mysql
