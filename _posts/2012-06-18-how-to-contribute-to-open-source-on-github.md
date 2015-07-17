---
title: How To Contribute To Open Source On Github
author: excid3
layout: post
dsq_thread_id:
  - 727634656
categories:
  - General
---
This is a step-by-step outline of the process I take to contribute to open source Rails projects.

Recently I got a great idea for a feature I wanted in Devise that was inspired by my friend [James][1] who I have been helping learn Rails over the past couple weeks.

We were talking about how to handle different types of users, and when the site is simple, there wasn’t a great way to handle this smoothly in Rails using Devise. So I set out to see what I could do.

Since this is something I think a lot of people can be uncomfortable doing, I want to document this process in its entirety. Let’s get to it!

### The Idea

A lot of sites are simple. You have a single User model, and the user has a `role` column that just stores a string like “user” or “admin”. Say you want the `/dashboard` path to be one view for users, and another view for admins. How do you handle this?

Typically with Rails, you’d setup a route for the dashboard and you would either redirect or render based upon the user role. There isn’t much more you can do in the routes:


      authenticated :user do
        get "dashboard" => "dashboard#show"
      end


You’d probably end up using a conditional to check what type the user was and render a different view based upon that:


    class DashboardController < ApplicationController
      def show
        if current_user.role == "admin"
          render "admin_dashboard"
        else
          render "dashboard"
        end
      end
    end


That's not very clean, plus I'm leaving out any different database queries that need to happen based upon the user. This isn't good. It would be nice if our routes could handle this case and go to a different controller action based upon the user instead. This would fit really well into the `authenticated` routing method:


      # Admins - showing off my idea
      authenticated :user, lambda {|user| user.role == "admin"} do
        get "dashboard" => "admin/dashboard#show"
      end

      # Regular users
      authenticated :user do
        get "dashboard" => "dashboard#show"
      end


### Validate Your Idea

So what if this feature already existed in Devise? We don't want to spend our time building something that already exists. I couldn't find anything in the Devise wiki or on a Google search. That's a good sign.

The first thing I did after that was running it by a friend of mine who uses Devise a lot. He thought it was interesting. That's good. Next step is to run over to the [Devise github page][2] and create an issue explaining the idea and asking if it makes sense. The issue for mine was [#1922][3]. I waited a short bit for his response and got this:

![][4]

It's approved! Let's get to work.

### Researching

So now that we know it's a good idea, we want to implement the feature. But where the hell do we start?? For this, I grabbed a fork of Devise so I could have my own copy and cloned it to my computer. You can use the github website to create a fork, and then clone it to your computer like so (provided you use your own git url for your fork).


    git clone git@github.com:excid3/devise.git


Now that I've got a copy of Devise on my computer, we can start looking into it a little better. I know that the `authenticated` method is related to routing and is going to be called `def authenticated`. There probably aren't too many methods named that, so this is a good thing we can search for. We open up the terminal and ack for that:

![][5]

Simple enough. Since the file is in `routes.rb` and there were no other results, we have to assume we are on the right track.

If you're interested in learning more about Ack, check out this site: 

So now that we have the location of the source for the `authenticated` method, we need to figure out how it works (at least enough to make our contribution). Let's take a look:


        # Allow you to route based on whether a scope is authenticated. You
        # can optionally specify which scope.
        #
        #   authenticated :admin do
        #     root :to => 'admin/dashboard#show'
        #   end
        #
        #   authenticated do
        #     root :to => 'dashboard#show'
        #   end
        #
        #   root :to => 'landing#show'
        #
        def authenticated(scope=nil)
          constraint = lambda do |request|
            request.env["warden"].authenticate? :scope => scope
          end

          constraints(constraint) do
            yield
          end
        end


Awesome, it's only a handful of lines! What we've got here is a constraint being set as a lambda...that checks the warden authentication...of a scope...okay what?? At least at the end it creates a regular routing constraint block and yields to the routes in the Rails app! Understanding the last 3 lines isn't bad for a start. ![:\)][6]

Let's take a deeper look at the first 3 lines of this method. So, we're assigning this variable as a lambda. A lambda is a block of code that can be executed later. We don't really need to worry about that, but we do need to understand about this whole warden thing.

The one thing we know is that the `authenticated :user do` route runs successfully when a user has authenticated. So what it looks like is this is creating a block of code that checks if a user is signed in, and then creates a regular Rails constraint out of it. The `:user` is what is passed in as the "scope". It's not required, and neither should the block we want to add either. Great!

So, the one thing we need before we can get started implementing our change is to figure out this stuff about Warden. What we need is to retrieve the User object from Warden and send it to our block.

If we can figure that part out, we should be able to easily build this feature. And we know this code authenticates the user, so surely there is something similar on the Warden documentation.

What better place to start than [Warden's github page][7]?

Sure enough, if you take a look at the Warden github page, you'll come across this: 

The first thing on the page looks interesting:


    env['warden'].user # provides the currently logged in user

    env['warden'].user(:admin) # allows for scoped authentication, this is the one we want for compatibility with Devise


That's the missing link! Now we are all set to implement this code.

### Implementation

So if you scroll up and take a look at what we've got earlier, it's pretty obvious we need to add another parameter for our block. Let's just name it exactly that:


        def authenticated(scope=nil, block=nil)
          ...
        end


Awesome, now that we have this block, we can ignore it if it is `nil`, but otherwise we need to execute that block. In ruby you use `.call()` to do that. We'll pass the warden user into this call method:


    block.call(request.env["warden"].user(scope))


That will call the lambda we send in from the routes file in the Rails app. Now, we need to integrate that logic if the block is left out.


      (block.nil? or block.call(request.env["warden"].user(scope)))


This will ignore the block if it doesn't exist, but run it if it does. That's good. Now where does this go?


        def authenticated(scope=nil, block=nil)
          constraint = lambda do |request|
            request.env["warden"].authenticate?(:scope => scope) and (block.nil? or block.call(request.env["warden"].user(scope)))
          end

          constraints(constraint) do
            yield
          end
        end


Constraints need to return true or false. Tacking the block logic onto the `authenticate?` makes sure that happens successfully, and then we try to execute the block.

At this point I setup a tiny Rails app with a User model having the role column, and tested the routes that we came up with before. You can do the same, but I'll assume you can take care of that on your own.

### Submitting Your Code

Github uses pull requests to manage code contributions. They are tightly integrated with Issues, so we can take advantage of what we've already done easily.

First we want to commit our code into git, and push to our git repo.


    git commit -am "Added a block to the authenticated route constraint"
    git push origin master


Now that we have our code pushed back up on github (in our own personal copy) we want to attach the changes to our issue and convert it to a pull request. There is a nifty little tool called "hub" you can use for this. Installing it is simple with Ruby:


    gem install hub


And then we can create our pull request:


    hub pull-request -i 1922 -b plataformatec:master -h excid3:master


This creates [a pull request][8] from Issue #1922 taking the code from `excid3:master` and suggesting it be merged into the `plataformatec:master` branch. And that's as simple as it is. You can go back to your pull request or issue url on github and you will see that your commits were linked at the bottom of the activity:

![][9]

You can also see that after I had included the commits I wanted, I asked to see if there were any tests I could write so that in the future, we could be sure that this code still works. Sometimes the author will have tests you can copy, others will not. This is kind of up to the author, but it's best if you can stick with their practices. In my case, he suggested I make one change, and pointed me in the right direction of writing tests.

![][10]

From here, I updated the code to use the suggested changes and then went on to write some tests for this code. Since writing tests is a whole new set of things to do, I'll leave my code for this out. It'll be unique in every case, but basically I copied a couple tests and added to their test rails app an "active" attribute to admin users. Then I created two routes to test one for each method I modified: `authenticate` and `authenticated`. The last step was writing four test cases to make sure that it denied and accepted both active and inactive admins. You can check out the tests I wrote [here][11].

With testing finished, I submitted them, asked if there was anything left, and successfully got my first feature to Devise accepted!

![][12]

Now you can use my code if you setup your `Gemfile` to use Devise version 2.1.1 or higher which includes my patch:


    gem "devise", "~> 2.1.1"


Run a `bundle install` and you're off to the races.

### That Wraps Up How To Contribute To Open Source

If the primary developers bring up any errors with your code, you can make the changes and Github knows to automatically include them in the pull request until it gets merged.

As you get more advanced with Rails, you'll want to start making a new branch for each of these features to keep things clean and separate. Hopefully this helps explain the process from start to finish. It's not as scary as it seems.

For most people, the first step to contribute to open source is to create an issue with your idea. The majority of developers are happy to help out. They understand how it was when they wanted to contribute to open source projects for the first time.

Now get out there and make [my projects][13] more awesome! ![:P][14]

   [1]: http://8bitbomb.com/
   [2]: https://github.com/plataformatec/devise (Devise)
   [3]: https://github.com/plataformatec/devise/pull/1922 (Issue 1922)
   [4]: http://cl.ly/3u0S0r1t3k3N2s3t2T3k/Screen%20Shot%202012-06-15%20at%2012.10.43%20AM.png (Jose Valim)
   [5]: http://cl.ly/2X1T3K1m3y3Z20282V3a/Screen%20Shot%202012-06-15%20at%201.17.32%20AM.png (Ack For "def authenticate")
   [6]: http://excid3.com/blog/wp-includes/images/smilies/icon_smile.gif
   [7]: https://github.com/hassox/warden (warden)
   [8]: https://github.com/plataformatec/devise/pull/1922 (pull request 1922 for devise)
   [9]: http://cl.ly/2S453u2d3b163Z060E3f/Screen%20Shot%202012-06-15%20at%2012.22.45%20AM.png (Pull request commits and questions)
   [10]: http://cl.ly/3V231l0I0J0U0T2V2l1H/Screen%20Shot%202012-06-15%20at%209.12.30%20AM.png (Pull request update)
   [11]: https://github.com/excid3/devise/commit/37c55eb192ca156ecccbcc1ec095d89f820383d2 (tests for devise)
   [12]: http://cl.ly/2F2j2y3q2E131a3M2G3B/Screen%20Shot%202012-06-15%20at%201.33.18%20PM.png (Merge success)
   [13]: http://github.com/excid3 (Chris Oliver's github page)
   [14]: http://excid3.com/blog/wp-includes/images/smilies/icon_razz.gif
