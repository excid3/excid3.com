---
title: >
  Setting Up Rails On Ubuntu 12.10 Quantal Quetzal with Ruby, Node.JS, Nginx,
  Passenger, and MySQL or Postgres
author: excid3
layout: post
dsq_thread_id:
  - 863008149
categories:
  - General
---
Keeping up with the latest Ubuntu version is always quite the task. As usual, here’s my quick guide to setting up Rails on Ubuntu 12.10 Quantal Quetzal for hosting a production or development Rails application. This also works well for development, but you will most likely not need Nginx and [Passenger][1] if that’s the case. For development, you can use the bundled Webrick server for convenience. Note that you can set this up on either Ubuntu desktop or server versions and the instructions will be primarily the same.

## Install Ubuntu

I’ll leave this up to you. For me, I’m using Ubuntu Server 12.10 and the only extra option I chose was to install the OpenSSH server by default. If you’re using a VPS, you’re already going to have ssh server installed by default.

## Add The Deploy User

The deploy user is the user whom our application run as for security reasons.


    sudo adduser deploy

Fill out the password and you can skip the name and other details of this user as they aren’t important.

You can stay as your regular user or root for the following steps. It’s best that you don’t give your deploy user root access in case your application got compromised.

## Installing Our Dependencies

The following two commands are going to upgrade any existing packages we have as well as install the dependencies we are going to need to build Ruby properly.


    sudo apt-get -y update && sudo apt-get -y upgrade
    sudo apt-get -y install build-essential zlib1g-dev libssl-dev libreadline-dev libyaml-dev libcurl4-openssl-dev curl git-core python-software-properties


## Installing Ruby 1.9.3

Now you’ll want to grab the latest version of Ruby from [ruby-lang.org][2] and not necessarily use the one I’ve got listed here.

The following commands will download the Ruby source, extract it, configure and compile it, and then finally install Bundler.


    wget ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p286.tar.gz
    tar -xvzf ruby-1.9.3-p286.tar.gz
    cd ruby-1.9.3-p286/
    ./configure
    make
    sudo make install
    sudo gem install bundler


## Installing NodeJS

Another dependency we need to install is a Javascript runtime. A runtime is required for asset compilation with the Rails asset pipeline. We’re going to use node for this.


    sudo apt-add-repository ppa:chris-lea/node.js
    sudo apt-get -y update
    sudo apt-get -y install nodejs


## Installing Your Database

This is up to you of course, however I’d recommend using PostgreSQL if you’re unsure.

**Installing Postgres 9.2**


    sudo apt-add-repository ppa:pitti/postgresql
    sudo apt-get -y update
    sudo apt-get -y install postgresql-9.2 libpq-dev


##### OR

**Installing MySQL 5.5.27**


    sudo apt-get install mysql-server mysql-client libmysqlclient-dev


## Installing Nginx and Passenger

To install Nginx, we’re going to use Passenger’s install script to do that for us. Nginx modules must be compiled with it, unlike Apache.


    gem install passenger
    passenger-install-nginx-module


Just choose the first option (1) to download and install it for you. Accept any defaults it suggests, like installation directories. If you need custom options while compiling nginx, just follow choice #2.

After installation is finished, you’ll get some configuration tips for Nginx to use Passenger, and we’re going to make one other change. Open up `/opt/nginx/conf/nginx.conf` and add the following line at the top:


    user deploy staff;


This will configure your nginx workers to run as the deploy user instead of root.

Since we are compiling nginx from source, we don’t get the nifty start/stop script from Ubuntu’s package. The reason we did compiled from source was so that we can always get the latest version of Passenger and Nginx (or if you needed anything custom installed).

Let’s grab an init script from Linode’s website and install it.


    wget -O init-deb.sh http://library.linode.com/assets/660-init-deb.sh
    sudo mv init-deb.sh /etc/init.d/nginx
    sudo chmod  x /etc/init.d/nginx
    sudo /usr/sbin/update-rc.d -f nginx defaults


Once that’s done, you can start and stop nginx like so:


    sudo /etc/init.d/nginx stop
    sudo /etc/init.d/nginx start


## Wrapping Up Rails On Ubuntu 12.10

And that’s mostly it. If you’re using this for development, you can just `gem install rails` and get started.

For production, I’ll leave capistrano configurations up to you. You’ll be able to use the `deploy` user’s home directory to store the production application(s) and you can easily configure nginx like so:


    server {
        listen 80;
        server_name example.com;
        root /home/deploy/MYAPPLICATION/public;   # 