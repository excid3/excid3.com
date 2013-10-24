---
title: Using ActionMailer Without Rails
author: excid3
layout: post
dsq_thread_id:
  - 749621530
categories:
  - General
---
ActionMailer is pretty awesome. It does it’s job well, and as a Rails developer, you may be already familiar with it. Then you get tasked to build something that isn’t a Rails application. Using ActionMailer without Rails is easy, with a couple of gotchas.

## Setup Your Gemfile

The first step, of course, is to add action mailer to your `Gemfile`:


    gem "actionmailer", "~> 3.2.6", require: "action_mailer"


Perfect. Just run `bundle install` next and you’re off to the races.

## Create The Mailer

Once you’ve got ActionMailer required, you can create a mailer just like before. I setup a directory just like Rails for `app/mailers` and created `mailer.rb` inside:


    class Mailer < ActionMailer::Base
      default to: "chris@excid3.com"

      def notification(from_email)
        mail(from: from_email, subject: "New notification") do |format|
          format.text
          format.html
        end
      end
    end


The format block is what most people would be missing here. We can still render templates just like Rails does, but we have to specify the format(s) we want rendered. You can then create the `notification.text.erb` and `notification.html.erb` files in a views directory. I chose `app/views/mailers/notification.html.erb` for mine.

### Wiring It Up

The last step is to configure ActionMailer to look for the proper folder for the views as well as configure your SMTP settings. I setup my project to have an initializers folder like Rails does. This just needs to be run on boot of your application:


    ActionMailer::Base.raise_delivery_errors = true
    ActionMailer::Base.delivery_method = :smtp
    ActionMailer::Base.smtp_settings = {
       :address        => "smtp.gmail.com",
       :port           => 587,
       :domain         => "example.com",
       :authentication => :plain,
       :user_name      => "YOUR_EMAIL",
       :password       => "YOUR_PASSWORD",
       :enable_starttls_auto => true
      }
    ActionMailer::Base.view_paths = File.expand_path('../../../app/views/', __FILE__)


You may need to modify the configuration settings here. The view_paths need to point to `app/views`. ActionMailer will append `mailer/notification.html.erb` to that path when looking for a template.

That should be all you need to do! The `format` block was the only part that had tripped me up with this so hopefully you have any easy time with this as well.