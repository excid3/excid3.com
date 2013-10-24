---
title: Passwordless SSH on Ubuntu
author: excid3
layout: post
dsq_thread_id:
  - 160461280
categories:
  - Ubuntu
tags:
  - passwordless
  - ssh
  - Ubuntu
---
I’ve been working on quite a few computers on a small network lately (more details about that to come). This is a huge pain since I’ve only got 1 keyboard and mouse for the bunch. I’ve setup Synergy to make my life incredibly easier, but even still, it’s nice to be able to ssh into the other machines effortlessly. I also need passwordless SSH for some applications I’ll be running on them.

First off, you’ve got to install openssh-server on all of your machines. That’s really simple. “sudo apt-get install openssh-server”, done. Now you may want to allow any machine to ssh into the others, so you can use the rest of these steps on your own to accomplish that, but I’m making one machine the master node where it will be allowed to SSH into all of the rest, but only that one (for now).

Second step is to hop on the master node you designated and run “ssh-keygen -t rsa”. Follow the instructions and have it save to the default location and tell it to not use a password. Make sure to keep your private key private. This is very important.

The last step is what lets you login to the other machines using that ssh key you just created. It’s really simple.


    ssh-copy-id -i ~/.ssh/id_rsa.pub username@HOSTNAME.local

Just replace the username and hostname and you’re done. Do this for each of your machines and now you can use ssh passwordless and painless.