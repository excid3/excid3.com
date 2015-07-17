---
title: Rails Security in the Wild
author: excid3
layout: post
dsq_thread_id:
  - 972570940
categories:
  - General
---
While we might get goodies like CSRF protection by default and we might use Devise and we might use ActiveRecord to protect from SQL injection, it’s extremely easy to miss something. I think Rails security is something we take for granted because we have such a robust framework to use. We expect it to do just do the sanitizing for us.

Here’s a great little talk that can help open your eyes about web security a bit given by [@mkonda][1] and [@claudijd][2].

The hard question to ask here always is “Well how do we focus on this in our day to day development?” You’re a developer, so your job is to build things that work. It becomes really hard to focus on both building something functional and secure at times. If that’s the case, take a step back and figure out exactly what you’re doing. Why is it so hard?

Programming is a wonderful field in that a problem can be solved 100 different ways. So, if you come across something you’re struggling to make work, think it out. Are you really solving it in the most useful way possible? That will have implications on usablity, security, and maintainability.

Does the user really need to type in HTML? Can it just be Markdown instead? Chances are you should be using something like Markdown anyways. Most people don’t know what HTML tags are available, nor what they do.

Remember that Rails is not a magic bullet for security. You’re building software that real data will go into, so you need to try attacking it before sending it out into the wild. Don’t use `raw` because someone told you to. Don’t remove `protect_from_forgery` because someone told you it fixed their problem.

Educate yourself. Read the [Rails security guide][3] and ask questions if you don’t understand something. [Ask me][4]. [Ask mkonda][1]. Ask your whomever, just make sure you learn what you’re doing, especially before you start building software that deals with money or other important data.

   [1]: http://twitter.com/mkonda
   [2]: http://twitter.com/claudijd
   [3]: http://guides.rubyonrails.org/security.html (Rails Security Guide)
   [4]: http://twitter.com/excid3

<iframe src="//player.vimeo.com/video/55275065?title=0&amp;byline=0&amp;portrait=0&amp;color=ffffff" width="770" height="578" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
