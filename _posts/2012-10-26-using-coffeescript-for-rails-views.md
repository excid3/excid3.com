---
title: Using Coffeescript For Rails Views
author: excid3
layout: post
dsq_thread_id:
  - 901486035
categories:
  - General
---
With the introduction of CoffeeScript coming with Rails since version 3.1, a lot of people have begun making heavy use of it. Most of my CoffeeScript use has been with assets, while I haven’t been using CoffeeScript for Rails views.

## First, Rails Views Using Javascript

By default, Rails forms with the `remote: true` option set, will submit as JS to the server. An example request from your logs would look something like this:


    Processing by ProjectController#create as JS


The `as JS` portion will instruct the Rails controller to use the Javascript format for rendering a view as the result. You can toss in a file named `app/views/main/create.js.erb` and write any Javascript and ERB that you’d like. Let’s just say we have this Javascript we want to execute on a successful AJAX create:


```
$("ul#projects-list").append("<li><%= @project.name %></li>");
```


This just pretends that we have a list of projects, and we want to add the new project to the page without refreshing after we’ve created it. Pretty simple.

This is fine and dandy, but what if we want to switch

## Switching to using CoffeeScript for Rails views

Let’s switch this create view over to CoffeeScript.

First, we want to switch the filename from `create.js.erb` to `create.js.coffee.erb`. This instructs Rails to use CoffeeScript when rendering the view.

You can then swap the code inside over to CoffeeScript:

```
$("ul#projects-list").append "<li><%= @project.name %></li>"
```

This isn’t a great example to show off CoffeeScript’s capabilities, but chances are you won’t have anything too complex in these types of views anyways.

### Not finding CoffeeScript views in Rails production environment

While this is actually completely functional in development, the way that Rails includes the CoffeeScript gem is that it will only be used for asset compilation on a deployment. In development, you need to always compile your CoffeeScript no matter what, however in production, the assumption is that you’re only using CoffeeScript in the assets directory. The reason for this is that in production, you want to do the least amount of work necessary, and rendering CoffeeScript for these small views should be considered unnecessary.

If you’re working on a smaller app however, it’s not such a big deal and you may prefer to write everything in CoffeeScript so that you can learn it better.

So using CoffeeScript for Rails views in production simply requires us to modify the Gemfile slightly. Take out the `coffee-rails` and `uglifier` gems from the `assets` group and move them outside. For a Rails 3.2 application, you’d end up with a Gemfile that looks like this:


    group :assets do
      gem 'sass-rails',   '~> 3.2.3'
      gem "bourbon", "~> 1.4.0"
      gem 'jquery-fileupload-rails', "~> 0.3.4"

      # See https://github.com/sstephenson/execjs#readme for more supported runtimes
      # gem 'therubyracer', :platforms => :ruby
    end

    gem 'coffee-rails', '~> 3.2.1'
    gem 'uglifier', '>= 1.0.3'


Save this, commit it, and the next time your run a deploy to your server, you’ll be able to handle the AJAX requests with CoffeeScript in production now.
