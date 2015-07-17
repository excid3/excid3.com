---
title: >
  Setting Up Ubuntu 12.04 with Ruby 1.9.3, Rails, Nginx, Passenger, and PostgreSQL
  or MySQL
author: excid3
layout: post
dsq_thread_id:
  - 679659620
categories:
  - Rails
---
With the recent release of Ubuntu 12.04, we’ve got an even easier way to setup our webserver. Let me walk you through the steps:

## Create Our Deploy User

One of the first things we want to make sure we get done is that we have a deploy user. This going to be the user that deploys the website and the same user that the website is run as.


    sudo adduser deploy


## Update and install our dependencies

This downloads the latest list of available software versions. We’ll install our build dependencies for later.


    sudo apt-get -y update
    sudo apt-get -y install build-essential zlib1g-dev libssl-dev libreadline-dev libyaml-dev libcurl4-openssl-dev curl git-core python-software-properties


## Install Ruby 1.9.3

We’re going to install Ruby 1.9.3 from source. Note that -p385 may not be the latest version of Ruby. Check out ruby-lang.org to get the latest version and replace it in the following commands:


    wget http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p385.tar.gz
    tar -xvzf ruby-1.9.3-p385.tar.gz
    cd ruby-1.9.3-p385/
    ./configure
    make
    sudo make install
    echo "gem: --no-ri --no-rdoc" >> ~/.gemrc
    sudo gem install bundler


## Install Nginx with Passenger

Since we’ll be using Nginx for serving our application, we’re going to install it using the Passenger installer. Nginx modules need to be compiled into nginx, unlike Apache, so we can’t just install the package from the PPA.


    sudo gem install passenger
    sudo passenger-install-nginx-module
    # Choose "download, compile, and install Nginx for me"
    # Accept defaults for any other questions it asks you


Next we want to setup a script to allow us to control Nginx. We’re going to grab this from Linode:


    wget -O init-deb.sh http://library.linode.com/assets/660-init-deb.sh
    sudo mv init-deb.sh /etc/init.d/nginx
    sudo chmod  x /etc/init.d/nginx
    sudo /usr/sbin/update-rc.d -f nginx defaults


You can now control Nginx with this script. To start and stop the server manually, you run:


    sudo /etc/init.d/nginx stop
    sudo /etc/init.d/nginx start


We can verify nginx is running by opening up Firefox and going to 

![][1]

After installation, you’ll get some tips on how to configure an Nginx server to listen on a domain and enable passenger for it. You’ll want to save this for later when you setup your deployment scripts. The root path there will be the public directory where you setup your Rails app folder.

One of the first things you want to do is edit the `nginx.conf` so that you can tell it to run as the deploy user. This file will be `/opt/nginx/conf/nginx.conf` and you can add this as the first line:


    user deploy staff;


#### Alternative: Nginx With Unicorn

An alternative to Passenger is to install Nginx from it’s PPA and use Unicorn instead. This is preferred, but it takes a bit more setup. I won’t get too much into this, but you can install just plain Nginx with the following commands:


    sudo add-apt-repository ppa:nginx/stable
    sudo apt-get update
    sudo apt-get install nginx
    sudo service nginx start


After this, I recommend checking out [Deploying To A VPS][2] by Ryan Bates for setting up Unicorn.

## Setup your database

Our next step is installing our database server. I’d recommend using PostgreSQL but many of you may prefer MySQL. Take your pick:

#### MySQL


    sudo apt-get install mysql-server mysql-client libmysqlclient-dev

OR

#### PostgreSQL 9.1.3


    sudo apt-get -y install postgresql libpq-dev

## Node.js for the Rails asset pipeline

One of the other things you’ll want is Node.js. This will help us do the compiling of assets on deployments. It’s a pretty quick installation to get the latest version:


    sudo apt-add-repository ppa:chris-lea/node.js
    sudo apt-get -y update
    sudo apt-get -y install nodejs


## Configure Your Rails App

You’ll need to get a copy of your rails application on the webserver. The best place to do this is to store it in the home directory of the deploy user. I recommend using Capistrano to set this up. Afterwards, you can modify your `/opt/nginx/conf/nginx.conf` file to contain a new passenger server like so:


    server {
    	listen 80;
    	server_name example.com;
    	root /home/deploy/myapplication/public;   # 