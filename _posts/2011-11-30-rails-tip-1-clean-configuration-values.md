---
title: 'Rails Tip #1: Clean Configuration Values'
author: excid3
layout: post
dsq_thread_id:
  - 488594922
categories:
  - General
---
### Rails Configuration Values

Source: 

First, we define a default value for all environments in `config/application.rb`:


    module Configurator
      class Application < Rails::Application
        # By default, let OSX resolve the path to the binary
        config.wkhtmltopdf = "wkhtmltopdf"
      end
    end


Then we override the default setting as necessary in `config/environments/`:


    Configurator::Application.configure do
      # Settings specified here will take precedence over those in config/application.rb

      # Point Heroku explicitly to the binary we need to use
      config.wkhtmltopdf = "#{Rails.root}/bin/wkhtmltopdf"
    end


Lastly, we access the configuration element in our code:


    cmd = [Configurator::Application.config.wkhtmltopdf, url, tmpfile.path]

Yes, that’s it. Just use Rails’s environment support and config to store your own configuration.