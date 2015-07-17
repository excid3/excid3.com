---
title: Ruby on Rails 3 and MySQL on Ubuntu 10.10
author: excid3
layout: post
dsq_thread_id:
  - 157250187
categories:
  - Ubuntu
tags:
  - mysql
  - rails
  - Ubuntu
---
Ruby on Rails has become my favorite web framework recently. The sheer speed factor of development is incredible, and once you get past the learning curve, you can build anything in a short matter of time.

Recently my Asus laptop’s graphics card has become supported in the Ubuntu kernel so I now have a dual booting machine running both Windows 7 and Ubuntu. This is particularly handy now as I can use this laptop for development in Rails.

The steps aren’t hard to figure out on your own if you’re familiar with the tools, but this is what I did to get Rails 3 with MySQL on Ubuntu 10.10.

**Installing Rails from Terminal**

> sudo apt-get install ruby-full
>
> wget production.cf.rubygems.org/rubygems/rubygems-1.3.7.tgz
>
> tar -xvf rubygems-1.3.7.tgz
>
> cd rubygems-1.3.7/
>
> sudo ruby setup.rb
>
> sudo ln -s /usr/bin/gem1.8 /usr/bin/gem
>
> sudo gem install rdoc
>
> sudo gem install rails

**Installing MySQL Server from Terminal**

> sudo apt-get install mysql-server libmysqlclient-dev libmysql-ruby

**Setting up your first Rails project**

It seems that Rails 3 depends on sqlite3 even if you don’t intend to use it as the backend for your application. We’ll create an example rails app to make sure everything is working.

> sudo apt-get install libsqlite3-dev build-essential
>
> rails new example
>
> cd example/
>
> bundle install
>
> rake db:create
>
> rails s

Now fire up your browser, and go to  and you should be greeted with a nice little rails homepage. ![:D][1]

**UPDATE: **I recently just ran these commands over again and ran into a “File not found: lib” error. After a bit of googling, I found this and appended the solution into the instructions above: 

   [1]: http://excid3.com/blog/wp-includes/images/smilies/icon_biggrin.gif
