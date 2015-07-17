---
title: Small Comparison of Ruby And Python Syntax
author: excid3
layout: post
dsq_thread_id:
  - 411767058
categories:
  - News
---
Following a discussion on Twitter with my friends [@astonj][1] and [@buddylindsey][2], we were commenting on the difference between Ruby and Python. There’s certainly no language that is better than another, however I wanted to point out a few things between the two languages that I did and didn’t necessarily like.

I come from a background of 4 years of Python experience and have been working with Ruby for only one year. Over this last year, my experience with the two languages has been very interesting. A little bit of background: My python experience was
primarily working on [Keryx][3] and a few Django web apps. Most of my Ruby experience has been building websites.

The main difference between the two languages’ feel is the ability to be explicit. This is something Python holds dear to its design. Take a twitter library for example. In Python you have a file called “twitter.py” and ruby you have a folder called “twitter.rb” each with a `class Twitter` inside. Simple enough, but what about using these in code:


    from twitter import Twitter

    t = Twitter()



    require 'twitter'

    t = Twitter.new


Both languages are very similar in structure, however Python is simply more explicit. When you use a library, you import exactly what you need. For me, this was an incredibly confusing point coming into Ruby. Why are you letting all these classes becoming available when I don’t even know what all might be there? I don’t even know what documentation to look at most the time unless I have a full stack trace in Ruby.

While being explicit is nice, it also adds a lot of unnecessary things. Take this for example:


    class DVDPlayer
        def __init__(self, disc):
            self.disc



    class DVDPlayer
      def initialize(disc)
        @disc = disc
      end
    end


Personally, I feel the Ruby version is a lot more succinct and readable for anyone to understand. Having `self` in every method seems unnecessary especially since it is required. Why do you need to declare it? Sure you can see where it comes from, but still you need to understand the concept of `self`. If you don’t understand it then it won’t make sense in either case.

Another thing to mention about this code example is `__init__` vs `initialize`. If you look at `__init__` it seems a little wonky. This is because Python doesn’t have the concept of private or protected attributes or methods. Normally in Python a private or protected attribute or method is prepended with an underscore or double underscore depending upon how private you want it to appear. This seems to jive well with the concepts of Ruby encouraging monkey patching, while Python is more conservative on this front.

Blocks are probably my favorite part in Ruby. On the surface, it’s similar to list comprehensions and passing a function to another function in Python, but it’s considerably cleaner. Ruby showcases this in loops well:


    nums = 0..9
    nums.each { |n| puts n }

    # OR
    # nums.each do |n|
    #   puts n
    # end



    nums = range(10)
    for n in nums:
        print n


Chaining in Ruby happens a lot and seems more expressive per line than Python. Often trying to write the same code in Python that I could do succinctly on 3 lines would be 6 in Python to keep the same level of clarity it feels like.

I could go on endlessly, but I don’t think it would do much good. If you like either language, enjoy it. No need to start a flame war, languages are mostly personal preference. Of course, I’m no expert in either language so take this with a grain of salt. I’ve fallen in love with Ruby’s flexibility and syntax over the past year and find it hard writing Python anymore. Feel free to comment your thoughts!

   [1]: https://twitter.com/#!/AstonJ
   [2]: https://twitter.com/#!/BuddyLindsey
   [3]: http://keryxproject.org
