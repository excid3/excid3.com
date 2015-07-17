---
title: Sharing A Devise User Session Across Subdomains With Rails 3
author: excid3
layout: post
dsq_thread_id:
  - 330219140
categories:
  - Rails
tags:
  - cookie
  - devise
  - path
  - rails
  - route
  - session
  - sharing
  - subdomain
  - url
  - url_for
---
Recently I’ve been working on a Rails application that supports subdomains. I’m using Devise for user authentication and need the user to choose a subdomain to use upon registration.

Similar to the 37signals applications, I want a single sign-on to be persistent across subdomains. Since I didn’t have a clue where to begin with subdomains, I followed [this tutorial][1] on my new Rails 3.1 beta 1 application. This tutorial worked like a charm and I omitted the friendly_id and tweaked a few things to my liking.

The gist of it is simple. Create a User model like you would normally do with Devise. You add a Subdomain model that is linked to the Users (in my case I only wanted a single subdomain per user). Configuring the routes is pretty simple as you can simply create a constraint that will match the root and fire it off to the right action and let the rest fall through.

The trick comes into sharing the session between domains. Browsers, of course, will separate out the cookies and store them by separated out by subdomain. What you want to do is edit your config/initializers/session_store.rb file to look like this


    APPNAMEGOESHERE::Application.config.session_store :cookie_store, :key => '_tourlyapp_session', :domain => "lvh.me"

The trick here is the `:domain` option. What this does is sets the level of the TLD (top level domain) and tells Rails how long the domain is. The part you want to watch out for here is that if you set `:domain => :all` like is recommend in some places, it simply won’t work unless you’re using localhost. `:all` defaults to a TLD length of 1, which means if you’re testing with Pow (myapp.dev) it won’t work either because that is a TLD of length 2.

You might get weird things like halfway Devise sessions sharing, but only allowing you to create and destroy the session on the root domain. Using `:all` works great if you’re using localhost, but when I started using lvh.me:3000 for testing I had those problems (lvh.me stands for local vhost me and is a domain that simply points to localhost which makes for zero-config subdomain development. It’s super handy.).

The best option might be to comment out this line and put it into your individual environment configurations. This way you can keep things configured easily as the `:all` option. Once you’ve got your domain string added everything should work like a charm.

**BONUS PROTIP: **The normal route variables you see used end with _path. These don’t include the domain and therefore ignore the :subdomain option you pass into them. `url_for`, on the other hand, does support subdomains so you should get into the habit of using root_url instead of root_path and so on.

   [1]: https://github.com/fortuity/rails3-subdomain-devise/wiki/Tutorial-(Walkthrough)
