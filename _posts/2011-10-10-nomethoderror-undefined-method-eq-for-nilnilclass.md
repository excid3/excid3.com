---
title: 'NoMethodError: undefined method `eq&#8217; for nil:NilClass'
author: excid3
layout: post
dsq_thread_id:
  - 439334539
categories:
  - News
---
I ran into this error the other day when trying to update a join table without a primary key:


    NoMethodError: undefined method `eq' for nil:NilClass

Unsurprisingly, ActiveRecord freaks out when you don’t have a primary key and gives you this error. Adding a primary key back into the fixes the issue. It’s a little unnecessary, however, it’s important to have a primary key so AR knows which record to update.

If you still don’t want to have a primary key, create a composite key across multiple columns. I ran into this issue because I was using acts_as_list and storing the position in the join table. Updating that position is what lead me down this path.