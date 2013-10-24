---
title: Change ActionMailer Email URL Host Dynamically
author: excid3
layout: post
embed:
  - This is the default text
image:
  - 
seo_follow:
  - 'false'
seo_noindex:
  - 'false'
dsq_thread_id:
  - 405418117
categories:
  - Rails
---
Recently I was working on a Rails application that had multiple domains pointing to it. As I was implementing Devise for authentication, I realized that when you configure ActionMailer in your intializer as most tutorials suggest, you won’t be able to change it using the request object.

Say, for example, we want to dynamically set the domain with a Devise confirmation email. ActionMailer doesn’t provide the `request` object for you to pass into the url method in order to change the domain like you would in a normal view.

Well crap, what do we do??

It’s actually easy. The best suggestion I have for solving this problem is that you create a `before_filter` that sets it on each request in `ApplicationController.rb` like so:


      before_filter :set_mailer_host

      def set_mailer_host
        ActionMailer::Base.default_url_options[:host] = request.host_with_port
      end


And voila! It’s automatically set on each request and your urls in emails should point to the domain they were created on.

One caveat of this is that sending mail from the rails console will default to what you have configured in your initializer. It is still important to set that because those actions will not pass through the ApplicationController beforehand.