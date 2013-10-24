---
title: Devise Username Authentication With Multiple Models And Subdomains
author: excid3
layout: post
dsq_thread_id:
  - 551005888
categories:
  - Rails
---
Devise is an awesome library for authentication with Rails. Things are extremely simple to setup for most cases but when you begin implementing slightly trickier business logic, it can become a pain. And the real reason is mainly just because the wiki needs a little love. They iterate quickly, and documenting everything in a newbie friendly wiki page is often hard to do. So I’m going to take a quick stab at documenting my implementation:

## The Problem

I’m working on an application that runs on multiple domains and subdomains. Each domain has it’s own set of admins and users. The admins are tied to a domain, and users are tied to a subdomain of that domain. Both of these need to allow authentication via a username field as opposed to the standard email field.

Starting out, we implemented the models just like normal with Devise. Generate custom views for each, and follow [this tutorial for adding username authentication][1].

After I got everything setup, admin users could login just fine, but users could not. What was worse, was the Devise Sessions controller was executing but never calling ` find_for_database_authentication` on the model. I had no idea what was going on, and all I could get Devise to do was return a **`Completed 401 Unauthorized`** error and immediately re-render the login form.

This is where we differentiate a bit. In that tutorial, they suggest that you set the `authentication_keys` in `devise.rb` like this:


      config.authentication_keys = [ :login ]

Well this is actually going to be the source of our problems. In order to authenticate admins based upon a specific domain, we’re going to include the `domain_id` inside of the login form as a hidden field. In order to use the `domain_id` inside the model for authentication, we added it to the authentication_keys array:


      config.authentication_keys = [ :login, :domain_id ]

But wait! That works for admins because they are based upon the domain. Users authenticate against a subdomain, not a `domain_id`. The users need authentication_keys like this:


      config.authentication_keys = [ :login, :subdomain_id ]

And we put the `subdomain_id` as a hidden field in their new session form. This is a problem, because the initializer only runs once. We need some way to change this at runtime based upon which type of user is authenticating.

## The solution

After a long time searching for a solution to the 401 Unauthorized, I found out that the authentication_keys was the cause of the problem (after having a hunch). The bad part was that I wasn’t able to find a method for debugging the issue.

I found the solution on [Stack Overflow][2] that pointed out that you’re actually able to set authentication_keys on the model itself in the devise call like so:


      devise :database_authenticatable, :registerable, ..., :authentication_keys => [:login, :domain_id]

Nifty! We can set these dynamically without touching the initializer. This lets us cleanly customize the authentication without much work. I’ll be updating the wiki to add this functionality because I certainly can’t be the only one who searched long and hard for a solution!

   [1]: https://github.com/plataformatec/devise/wiki/How-To:-Allow-users-to-sign_in-using-their-username-or-email-address
   [2]: http://stackoverflow.com/questions/3298506/about-user-authentication-with-username-and-subdomain
