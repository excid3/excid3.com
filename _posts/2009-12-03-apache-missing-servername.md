---
title: Apache missing ServerName
author: excid3
layout: post
dsq_thread_id:
  - 55195856
categories:
  - Python
tags:
  - apache
  - django
  - Python
  - servername
---
Today I was doing some Django and Python development and had just installed apache for the first time in ages. I wanted to serve up some static files on the machine for Django and when I started apache, I got the following error:

`chris@apoch:~$ sudo /etc/init.d/apache2 start
* Restarting web server apache2 apache2: Could not reliably determine the server's fully qualified domain name, using 127.0.1.1 for ServerName`

Now this error isn’t anything horrible. It occurred on a fresh installation of Apache2 on Ubuntu Karmic. The fix is simple:

`chris@apoch:~$ sudo vim /etc/apache2/httpd.conf`

And put insert the following line:

`ServerName localhost`

You can then issue a restart of Apache2 and you’re off to the races:

`chris@apoch:~$ sudo /etc/init.d/apache2 restart`