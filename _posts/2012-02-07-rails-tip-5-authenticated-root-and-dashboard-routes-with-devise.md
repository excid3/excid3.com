---
title: 'Rails Tip #5: Authenticated Root and Dashboard Routes With Devise'
author: excid3
layout: post
dsq_thread_id:
  - 567757208
categories:
  - Rails
---
Something that isn’t necessarily that well documented in Devise, is authenticated routes. Take, for example, most websites that allow you to login. When you visit the root url without being logged in, you get the homepage as normal. When you login however, the root url is now rendering your dashboard.

Sure we could do this with logic inside of the controller like so:


    class MainController < ApplicationController
      def index
        if user_signed_in?
          render "dashboard"
        else
          render "index"
        end
      end
    end


But guess what? **That's ugly.** And if you're querying the database in here, it gets even MORE ugly. Wouldn't it be nice if we could dynamically set the routes to change where the root url points when a user is logged in?

Devise's `authenticated` route allows you to do this nicely.


      authenticated :user do
        root :to => "main#dashboard"
        # Rails 4 users must specify the 'as' option to give it a unique name
        # root :to => "main#dashboard", :as => "authenticated_root"
      end


This feature has been around since Devise 1.4, but was never very apparent when searching through the docs and Stack Overflow. You can find the original pull request here: 

Bonus: There is also an `authenticate` route that you can use to force authentication. Warning though, if you use these, they'll redirect to login whenever they're matched which can cause problems. I recommend you stick to using `before_filter :authenticate_user!`.