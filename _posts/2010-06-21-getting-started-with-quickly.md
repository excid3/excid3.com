---
title: Getting Started With Quickly
author: excid3
layout: post
aktt_notify_twitter:
  - yes
  - yes
aktt_tweeted:
  - 1
dsq_thread_id:
  - 110036796
categories:
  - Keryx
  - Python
tags:
  - Keryx
  - Python
  - quickly
---
Recently an open source project called [Quickly][1] has sprung up and looks to be an incredible tool for new developers looking to work on open source GUI projects. The description from their website reads as follows:

> Quickly helps you create software programs (and other things) quickly. You can select from a set of application templates and use some simple quickly commands to create, edit code and GUI, and publish your software for others to use. Quickly’s templates are easy to write. So if you are a fan of language foo, you can create a foo-project template. Or if you want to help people making plugins for your killer app, you can make a killer-app-plugin template. You can even create a template for managing corporate documents, creating your awesome LaTeX helpers The sky is the limit!

Sounds like a cool project right? You bet. I’m going to be using Quickly to begin working on the official unstable branch for Keryx 1.0 and will outline the steps I took to get started here.

**Installing Quickly**

Super simple. Just fire up a terminal and “sudo apt-get install quickly” or install the quickly package via Synaptic or your favorite package management tool (maybe even through Keryx!). Once that is installed, you can fire up the documentation if you like by typing “quickly tutorial ubuntu-application” and it will open up the Quickly User Guide which is a handy reference.

**Creating a Project**

Nothing more than a “quickly create ubuntu-application keryx”. Just tells quickly you are building a new application with the Ubuntu template named Keryx. Simple as that. It sets up the directory structure for you and everything! So handy!

**Getting to Work**

Modifying the GUI is simple, just do “quickly design” and Glade is opened up with your ui file ready to go. The same goes for editing the code with a simple “quickly edit” which opens up all the files necessary for your application in your standard text editor.

**Committing**

“quickly save notes” is all you need to do to make a commit of your changes with the comment “notes” and submit this to launchpad using the bzr version control system.

There are a few other commands you might be interested in, mainly for packaging and releasing but this is a very simple tutorial on how we setup Keryx 1.0. If you’d like to contribute, just download the unstable code branch from launchpad and start using it with Quickly!

So I suppose I will leave it at that for now. Quickly is a way for new developers and contributors to easily be able to jump in and start working on projects. We will be using this for Keryx 1.0 and hope this will encourage contributions and make bugs easier to fix.

   [1]: http://launchpad.net/quickly
