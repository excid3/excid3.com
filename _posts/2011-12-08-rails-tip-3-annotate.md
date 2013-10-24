---
title: 'Rails Tip #3: Annotate'
author: excid3
layout: post
dsq_thread_id:
  - 497700246
categories:
  - General
---
As you jump between Rails projects, you’ll quickly realize that you end up checking the database schema to see which attributes your model has. This can get annoying to say the least, and that’s what the [Annotate gem][1] aims to solve.

It’s a quick install in your `Gemfile`:


    gem "annotate", "~> 2.4.0", :group => :development


Afterwards, just run `bundle install` and you’re ready to go. Just type `annotate` in terminal inside your rails application directory and it will generate comments in your models that look similar to this:


    class LineItem < ActiveRecord::Base
      belongs_to :product
    end

    # == Schema Info
    #
    # Table name: line_items
    #
    #  id                  :integer(11)    not null, primary key
    #  quantity            :integer(11)    not null
    #  product_id          :integer(11)    not null
    #  unit_price          :float
    #  order_id            :integer(11)
    #  created_at          :datetime
    #  updated_at          :datetime
    #



And there you go! You're able to easily reference what columns each model. While it's not anything groundbreaking, it saves me a couple minutes every day.

   [1]: https://rubygems.org/gems/annotate
