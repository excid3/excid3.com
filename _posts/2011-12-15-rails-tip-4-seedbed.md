---
title: 'Rails Tip #4: Seedbed'
author: excid3
layout: post
dsq_thread_id:
  - 505436855
categories:
  - General
---
Depending on your project, you might need to create a significant amount of seed data. Upon launch, you’ll probably need your team setup as admin users, get some content up on the site so it doesn’t look like a barren wasteland.

Sure, I know how to do that. I’ll just slap it all into `db/seeds.rb`!

That’s fine…if you’re only create a handful of things. Say you want to organize things? Say you want folders? Say you want to only run certain seeds?

## In Comes Seedbed

[Seedbed][1] allows you to create files in the `db/seeds/` directory that you can run either individually or you can “plant” them in `seeds.rb`.

Take this for example:

Here we’ve got a seed that creates only Admin users. With seedbed, we can put this file inside `db/seeds/` and then execute it like so:


    rake db:seed:admins

How cool is that? Say we’re playing around with features and need to truncate the Admin Users table locally. We can repopulate the admins very simply without recreating the whole set of seeds.

You can even add them to `db/seeds.rb` to automatically run the nested seeds themselves:


    plant :admins


And run the `rake db:seed` command as normal to automatically run all of the custom seed files.

[Seedbed on Github][1]

   [1]: https://github.com/esmarkowski/seedbed
