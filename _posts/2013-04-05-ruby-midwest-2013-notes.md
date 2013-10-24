---
title: Ruby Midwest 2013 Notes
author: excid3
layout: post
liveblog:
  - enable
dsq_thread_id:
  - 1188632039
categories:
  - General
---
The official IRC Channel for Ruby Midwest is #rubymidwest on Freenode.

## Ready To Code: Automate your development environment
David Kerber

Virtualization Pros
* Full size Virtual Box images with Ubuntu preconfigured
* Consistency

Virtualization Cons
* Upgrades are tricky
* Difficult to share
* Lots of disk space
* Code is in the virtual machine

Vagrant
* Lightweight, sharable
* Works with VirtualBox and VMWare
* Uses very little disk space
* Cheap and easy to create new environments
* **Executable documentation of configuration**
* No context switching while editing

Use Puppet to configure your packages.

Check out the mailcatcher gem.



## Service Oriented Architecture Safari In The Amazon
Bryan Thompson

PCI Compliance means you have to update all code to the latest version no matter what. All gems need to be reviewed and it’s very time consuming and hard.

Patchinator scrapes CVEs related to all system updates in your production systems.

Deployinator:
Continuous integration completes successfully and deploys them to production.
Stage 0 AMI comes from Ubuntu.
Stage 1 AMI gets security updates, and puppet manifests.
Stage 2 AMI adds code, runs through CI, and is production ready.

## Object Oriented Programming and Philosophy
Steve Klabnik

As a child, your understanding of how the world works directly maps to how you write code.

Do bugs come up because we’re trying to model an imperfect world with a perfect representation in code? An hand drawn circle might not be perfect, it might not connect and it might be lopsided, however we can all understand it is a circle because we know the concept of it.

Philosophy in a time of software mailing list: https://groups.google.com/forum/#!forum/philosophy-in-a-time-of-software

There’s no reason for launching your project by tearing down another project. It’s not wrong to criticize, but we should be building new stuff and sharing the joy of open source with each other.

## Failure for Fun and Profit!
Kerri Miller

If you’re not making mistakes and breaking things on purpose, how can you really know why or how it works? “Experience comes from bad ideas.” Having all the answers means you’re only trying the achievable.

Why is something new stressful? We don’t want to look foolish in front of ourselves or other people. If you want to sharpen a skill or talent, try reducing the risk of failure. Turn failure into just a data point.

If you don’t run into things that you don’t know when you’re practicing, then you’re not really practicing. Learning is the discovery of truth, not the acquisition of knowledge.

## Making Testing Fun With Test Reporters
Matt Sears

Test Reporters are ways to print out the results from a test suite in a different way. Emoji and nyan cat are two examples of ways you could make the test output a lot more fun.



## Frustration Driven Development
Evan Light

Test all the f*cking time.
ActiveRecord callbacks are bad.
Stop to refactor code, even if you’re in a rush. Extract out code into simple methods with meaningful names. Example “notify_collections_about_overdue_bills” could be extracted from a complicated User method.
Moving code into modules looks better, but it’s pretty awful. You’re just moving the logic around.
Use presenters instead of helpers when you have 3 or more methods that you need to extract so that you can take logic out of the helper.
Monkey patching is bad. It’s better to go participate in open source than open source. Don’t monkey patch a feature when you could extend the open source library instead. You won’t be the only one that it could help.

**Law of Demeter**
You can play with your friends.
You can play with your privates.
You shouldn’t play with your friends’ privates.

Predictable and boring is good because it makes code understandable.

Ask yourself “what’s wrong here?” instead of continuing to chug along.

**Happiness matters more than anything. It’s determined by the relationships you have and by doing things that you care about.**

## Must Have 10 Years People Experience
Ashe Dryden

Solve actual problems, it’s easier to have excuses.

We forget what it’s like to be a beginner. The answer isn’t always apparent, but assuming we know the correct answer because we see ourselves as an expert is the wrong approach. Don’t offer information unless asked because it allows you to potentially learn things and get a new perspective.

## Rails Application Security in Practice
Bryan Helmkamp

Github’s public key security vulnerability was a huge security issue, followed by Rubygems.org forcing verification of all the gems hosted on the site.

#### 7 attacks and countermeasures

**1\. Session Hijacking** – Attacker observes the session ID and then makes requests to the server as the user.
Firesheep lets you easily hijack sessions on popular websites.

Counter measures:
\- Force SSL everywhere


    config.force_ssl = true

\- Secure and HttpOnly cookies
\- Strict-Transport-Security
Closes a hole in the SSL implementation of websites and tells browser that all communication is supposed to be over SSL.
\- Require password for sensitive actions

**2\. Brute Forcing Passwords** – How many passwords can we guess per second?
Use bcrypt or scrypt so that guessing a password hash can only be done a small amount of times per second.

**3\. Insecure Direct Object Reference**
Allows you to construct a URL that can retrieve any data from the server.

Solutions:
Use proper scoping


    def show
      @user = User.find(params[:user_id])
      @post = @user.posts.find(params[:id])
    end


Authorization (gems like CanCan)

**4\. Mass Assignment** – Specify the attributes that are allowed to be changed by a user.
Safe attributes like a username should be allowed for the user to edit, but a user should not be able to set themselves as an admin.

Solution:
strong_parameters

**5\. Cross Site Request Forgery** CSRF

Solution:


    class ApplicationController < ActionController::Base
      protect_from_forgery
    end


Make sure GET requests are safe.

**6\. SQL Injection**
Make sure you understand the ActiveRecord APIs well.
Review

**7\. Cross Site Scripting (XSS)**

Be extremely careful with `raw` and `html_safe`.
`link_to` href attributes aren't escaped.

Solutions:
rails_xss feature is on by default in Rails 3 . It escapes everything by default.
Sanitize user-generated HTML - Use the Loofah gem
Content Security Policies (CSP)

### Brakeman

Gem for doing static analysis on security vulnerabilities.

[RailsSecurity.com][1] is going to be a free Ebook about threats and countermeasures for Rails applications.

## Ruby Groups: Act Locally - Think Globally
PJ Hagerty

Give everyone in your Ruby group a job. Don't let the leaders do all the work. Communities should collaborate with each other, including other groups. Don't be too focused, anything that's interesting should be encouraged. Reach out to larger audiences.

## Standards
Michael Feathers

Ubiquitous but painful. Standards are great ideas, so we want to follow them. Uniform methods across the system don't always apply. Coding standards are similar to performance enhancements in that it's highly contextual.

## Computer, Program Thyself!
Zee Spencer

Knowledge moves from mystery to algorithm over time. Creativity is how we move along that funnel.

## More time for Open Source work with the help of the Pomodoro Technique
Matthias Günther

Getting into open source is as simple as picking something you love, working on it, and then talking about it.

**Pomodoro Technique**
1\. Choose a task to work on
2\. Set a timer for 25 minutes
3\. Work without stopping until the timer goes off
4\. Have a 5 minute break

## Nobody will Train You But You
Zachary Briggs

When you have the answer, it's easy to say "Oh yeah, I understand it." On the other hand, when you're working on something, it's a lot harder to know the answer.

The stuff you know is the smallest, the stuff you know you don't know is larger, and the stuff you don't know that you don't know about is the largest group.

The people are best at something do it because it's fun.

## Functional Principals for Object-Oriented Development
Jessica Kerr

Ruby developers have a lot of discipline compared to .Net and Java developers. We choose to impose that on our code and ourselves.

Our job is not to write software. Our job is to convert data into information.

## Lightweight Business Intelligence
Corey Ehmke

A naive approach is reporting data from a transactional database because it's slow and awful.

Figure out key performance indicators and what sort of questions you're asking on a daily basis. Learn how to tell a story with your data.

MongoDB gives you flexible schemas. Use SQL for transactions, NoSQL for reporting. Business logic belongs in your applications, not in your database.

## The Most Important Optimization: Happiness
Ernie Miller

When you have a certain level of familiarity, you can do some pretty stupid things.

You should put a lot of time to determine what's right for you. Job, work, relationships, everything applies to happiness.

Programming is written communication.

## Keynote
James Edward Gray II

It's a great programmer who applies the correct amount of process and architecture design to each situation. There are always times when a "cowboy coder" who gets things done quickly makes more sense than an "architecture astronaut" who spends a lot of time planning.

You shouldn't over-engineer something based upon what you think you might need later on. It doesn't mean you should avoid building flexibility into your code.

Write a comment to get stuff out of your head, and then rewrite the code to make the comment superfluous.

   [1]: http://RailsSecurity.com
