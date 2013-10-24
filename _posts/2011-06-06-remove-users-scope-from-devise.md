---
title: Remove Users Scope From Devise
author: excid3
layout: post
dsq_thread_id:
  - 323736986
categories:
  - Rails
tags:
  - authentication
  - devise
  - routes
  - sessions
  - user
---
Devise is awesome for authentication. I use it constantly. The one thing I am really pleased with is how flexible it is.

Since Devise is generally in the users scope the urls it uses are `/users/sign_in`. This isn’t very user friendly and I’d like to change that. It’s pretty straightforward but might not be what you expect:


      devise_for :users, :skip => [:sessions] do
        get "/login" => "devise/sessions#new", :as => :new_user_session
        post "/login" => "devise/sessions#create", :as => :user_session
        get "/logout" => "devise/sessions#destroy", :as => :destroy_user_session
      end


Here we use the `devise_for` just like normal. We skip all of the session routes however. This lets us define our own so that we can completely customize them on our own. Since our get and post routes start with a slash they will be created at the root and we can send them to devise just like before.

Much cleaner, and easy for users to remember!