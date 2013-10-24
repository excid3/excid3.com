---
title: 'Rails 3.1 &#8211; It&#8217;s almost here!'
author: excid3
layout: post
dsq_thread_id:
  - 296110107
categories:
  - News
tags:
  - 3.1
  - awesome
  - coffeescript
  - haml
  - javascript
  - jquery
  - rails
  - sass
---
![][1]As a huge Rails fan, I was extremely pumped to see that Rails 3.1 beta 1 was released today. What does this mean for our favorite web framework? A couple things, overall good, but you have to be accepting of the Rails way.

## JQuery

This is, of course, probably the most welcomed change in Rails 3.1. I know just as a small time developer most of the projects I work on have switched to using JQuery for its popularity. There are a plethora of external libraries out there for it and is simply more common than the other frameworks out there. This is an excellent move.

## CoffeeScript

Another incredibly welcomed addition to Rails 3.1 is CoffeeScript. As many people have come to realize, Javascript is often very unclean and illogical. CoffeeScript’s aim is to clear this up while providing a lot of syntactic sugar. It removes a lot of the idiosyncrasies while providing a much more readable format. It, of course, is not without it’s opponents. You’re learning something that isn’t really Javascript, but it’s certainly better than trying to debug RJS.

The [Github commit][2] that included CoffeeScript has a very funny and controversial set of comments that you should definitely check out for a good laugh.

## Sass

OMG. Sass. If you haven’t used this yet, you’re missing out. It’s CSS with variables, functions, nesting, and more. What more is there to say? It’s just plain awesome. You can still write your css as normal, but now you’ve got a whole set of tools to make your life easier.

## Nice! But what about HAML?

Yeah, you noticed it was missing too. So I’m sure that I’m not the only one, but I just don’t like HAML. It feels weird. Unlike CoffeeScript and Sass, with HAML you’re not really improving the underlying code. You’re simply abstracting it and giving it a more pleasing look. There’s no actual features that it adds and I think this is where most people feel uncomfortable using it. To me it just feels dirty. Sure it looks much better, but there really isn’t a whole lot of benefit I gain from it. Some things it doesn’t support and that’s enough for me to have a bad taste in my mouth. [I’m not the only one.][3] That’s not to say it’s bad to use, it’s just not my thing.

So that’s the main changes in Rails 3.1. I think it’s a great move forward and, while forcing me to learn a few more languages, it’s an important movement. Rails has always been a well curated group of tools. This is just another iteration as the tools continue to grow and improve along with the community.

I know I’m going to be sure to start any new projects with Rails 3.1 and hope that I can contribute patches into Rails core as I go.

   [1]: http://excid3.com/blog/wp-content/uploads/2011/05/rails.png (rails)
   [2]: https://github.com/rails/rails/commit/9f09aeb8273177fc2d09ebdafcc76ee8eb56fe33
   [3]: http://intridea.com/2011/5/4/i-heart-sass-but-haml-im-just-not-that-in-to-you
