---
title: 'Heroku: ActionView::Template::Error (.css isn&#8217;t precompiled)'
author: excid3
layout: post
dsq_thread_id:
  - 429583222
categories:
  - Rails
---
As I was deploying an application recently, I ran into this error:


    ActionView::Template::Error (gmaps4rails.css isn't precompiled):

This, of course, is caused by the new asset pipeline and the Rails 3.1 defaults. If you have the same trouble, it’s a quick solution. Production needs to be told to compile assets. Open up `config/environments/production.rb` and change the following line from false to true:


      # Don't fallback to assets pipeline if a precompiled asset is missed
      config.assets.compile = true


And voila! Commit, push to Heroku, and you should be good to go!

## Update:

This solution isn’t ideal. It will compile the assets each request which is very slow. The best solution is add `config.assets.precompile = %w( *.js *.css )` to `config/application.rb` and then run the `rake assets:precompile` and commit the compiled assets to your repository before pushing to Heroku. You’ll also want to modify the `config/development.rb` to change serve public assets to false otherwise you will get duplicate assets in development. Please check out this article on Heroku for more information: 