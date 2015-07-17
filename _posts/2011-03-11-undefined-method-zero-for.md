---
title: 'undefined method &#8216;zero?&#8217; for #<OrderedHash {}>'
author: excid3
layout: post
dsq_thread_id:
  - 251733308
categories:
  - Rails
tags:
  - 3
  - group
  - hash
  - rails
---
As I was upgrading some code to the new ActiveRecord syntax (which is beautiful by the way), I ran into an issue. The query worked perfectly fine before with the` find()` call returning an array, but as I moved to the new syntax, ActiveRecord returns a Relation instead.

My query was fairly simple, and I just wanted to determine if the results were empty or not. We are using this code in our Senior Project, a simple web application for SIUe’s campus to make campus tour management a whole lot easier. We have several different areas where we need to query for the available tours, or all the tours in a given calendar month, etc. I made the query before where it would return an array. This new syntax ended up returning a Relation to the `@tours` variable. A call to `@tours.empty`? actually gave me this error:


    undefined method 'zero?' for #

What was weird, was if I added this line (or anything else that used `@tours`) the error never crept up again:


    puts @tours

Internally in Rails, when you do a group query, you’re changing the type of the `count` variable inside the Relation class. Normally it’s a simple Integer that keeps track of how many objects are returned if the results haven’t been loaded yet. Once you make a call to it, the results are loaded, and the `empty?` no longer relies on the count variable as it can use the length of the results array instead.

Since a group returns an `ActiveSupport::OrderedHash` as the type for the count variable, this causes a problem. The `zero?` is implemented for `Numeric` types, but not an `OrderedHash` obviously.

The solution to this is to simply patch Rails’ `ActiveRecord::Relation` like so:  Simply check the type to make sure it is `Numeric` and continue using `zero?`, otherwise we should check to see if the count is `empty?` for the case where count is an `OrderedHash` or even some other type.

Hopefully my patch gets pulled into Rails 3.0.6 core! I’ve got my fingers crossed. ![:D][1]

   [1]: http://excid3.com/blog/wp-includes/images/smilies/icon_biggrin.gif
