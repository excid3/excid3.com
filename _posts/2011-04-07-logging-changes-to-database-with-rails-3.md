---
title: Logging Changes To Database With Rails 3
author: excid3
layout: post
dsq_thread_id:
  - 273652069
categories:
  - Rails
tags:
  - actions
  - database
  - events
  - logging
  - rails
---
If you’ve ever built an application that has multiple users, you might have considered adding a logging feature to keep track of modifications a user has made. So how do we do this very simply in Rails 3?

First, we need a model to store this information in. Because we are building an extremely simple logging system, we’ll just create a model that’s attached to a user and contains a small string summary of the changes that were made.


    rails g model Log user_id:integer modification:string

After generating the model, you can add a simple search scope to it which allows logs to be searchable as well.


    class Log < ActiveRecord::Base
      belongs_to :user
      default_scope ![:o][1] rder => "created_at DESC"

      def self.search(search)
        if search
          where(["modification LIKE ?", "%#{search}%"])
        else
          scoped
        end
      end
    end


We can setup a User for `has_many :logs` so we can directly access a user’s actions as well.

Since we’re logging user actions, we can’t access current_user inside of a model. I don’t know the best way to do this, but what I have done, is created a simple function to log a message if the user is logged in. An after filter might be a good use for this type of functionality so you could remove these lines from the controller actions and condense them to a single function called automatically every time.

Sometimes an action may be executed by a user who isn’t signed in, this also takes care of that possibility.


      def log_action(message)
        if current_user
          l = current_user.logs.new(:modification => message)
          l.save
        end
      end


In the controller actions, you simply call it and pass in a message like so:


    log_action("deleted #{visitor.first_name} #{visitor.last_name}")

This is a very simple implementation, but the end result is a nice basic searchable log of everything that has happened on the website.

   [1]: http://excid3.com/blog/wp-includes/images/smilies/icon_surprised.gif
