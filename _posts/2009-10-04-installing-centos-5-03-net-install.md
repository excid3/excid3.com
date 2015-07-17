---
title: Installing CentOS 5.03 Net Install
author: excid3
layout: post
dsq_thread_id:
  - 55195834
categories:
  - General
tags:
  - cent
  - centos
  - net install
  - netinstall
---
Seeing that I’m going to be graduating in less than 2 years, and hopefully starting my own business, I figured it’s time that I get some hands on experience with enterprise grade software. Redhat and Suse both provide great enterprise products, however CentOS is free. I cannot pass that up. Here’s a quick walk through of installation:

**1)** Download the netinstall iso. You can get this from the CentOS website. Grab the latest version, I am using 5.3: http://www.centos.org/

**2)** Do what you need to get it running on your machine. I’d recommend using unetbootin for this if you’re installing it on a box. I’m actually installing in Virtualbox so you can do it how you like. Now on my installation of Virtualbox 3.0.6 on an AMD 9600, I ran into an issue where CentOS just hangs on boot. It doesn’t get hardly anywhere, but it does make it past grub. The issue turned out to be that IO-APIC was disabled on the VM for some reason. Double check that option is enabled if you’re encountering the same issue.

**3)** When you get to the installation method, select HTTP and configure it as such:

**Webite Name:** mirror.centos.org
**CentOS Directory** centos/5.3/os/i386

**4)** Finish going along with the GUI to partition your drives and install the desktop or server environment and extra packages you’d like.

Simple as that. Nothing too complicated and you’ve got an enterprise ready server!