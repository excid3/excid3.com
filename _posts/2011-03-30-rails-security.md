---
title: Rails Security
author: excid3
layout: post
dsq_thread_id:
  - 267010796
categories:
  - News
---
Last week I attended the absolutely wonderful Ruby on Ales conference. Jim Weirich & Matt Yoho gave a presentation on Rails security and I wanted to go over a few of the points.

### SQL Injection

This shouldn’t be anything new to a web developer. You always hear about this when someone speaks about databases, but it’s easy to forget to sanitize. MYSQL.com recently got [compromised][1] by this vulnerability and you should always keep it in mind.

So how do we approach this? **NEVER** inject user input into SQL strings. If there is any chance that this could happen, make sure you use the builtin Rails functionality for this. Parameters that need to be passed in by Rails so they can be properly escaped.


    Client.where("orders_count = ?", params[:orders])

Every question mark will be replaced with the next item in the list of arguments passed. They will be properly sanitized and you can safely make SQL queries without worrying about injection.

### Mass Assignment

This one is a vulnerability that may not be quite apparent from the beginning. Say you have a User model that has a password field. If you use User.update_attributes and params[:user] contains a :password field, then you can simply modify the request to tack on the password attribute and you could change a user’s password.

This is a subtle vulnerability, but easily remedied by whitelists. Instead of using blacklists, which forgotten fields would be exposed, a whitelist allows you to only expose the properties of a model as needed.

### Scope

Another obscure, and easily overlooked issue is scoping of database queries. Say you have a user owns several private todo lists. Your url has the :id of the todo list and your database query just does a quick find on the List model like so:


    List.find(params[:id])

That’s all find and dandy. It works great and there are no noticeable problems with this. Now the problem here is that we aren’t checking against the current user’s lists. A user has many lists, but they shouldn’t be accessible by other people. The current database query exposes every list to anyone who types in a different id. Instead of this, you can do a query on the current user instead:


    current_user.lists.find(params[:id])

This will scope the query to the current_user’s lists only, permitting only viewing of the lists that user is tied to.

### Cross Site Scripting – XSS

When a user inputs text, an attacker could insert javascript, which could write out the user’s cookie, and other information. Rails will filter this by default, however if you use the RAW tag, you can bypass this. Sometimes you still want formatting and because of this, the h tag should be used instead.

### Cross Site Request Forgery – CSRF

When you login to a site, you have a session stored in your cookies. CSRF exploits this by having a remote site redirect you to a URL on another site where you are logged in. This redirect can be used to request a action or other action on a different site. Rails 3 protects against this by default by supplying a CSRF token embedded into every form that is rendered. It is important to use the provided form generators instead of writing raw HTML forms because of this. Don’t use GET requests to modify the database because they will have no CSRF token to check against.

### Rails Security Summary

Most of these Rails security tips can be applied to any web development. Things like mass assignment are more Rails specific, but you can see how they could also be applied to other web frameworks. This is by no means a guide to fully protecting a Rails (or any) web app, however it is a good start to understanding the common attacks and ideas behind them.

For a more in-depth explanation of Rails security, check out the [Rails Security guide][2].

   [1]: http://seclists.org/fulldisclosure/2011/Mar/309
   [2]: http://guides.rubyonrails.org/security.html
