---
title: Using Reverse SSH Tunneling
author: excid3
layout: post
dsq_thread_id:
  - 55195823
categories:
  - Hacking
tags:
  - reverse
  - ssh
  - tunnel
  - tunneling
---
On campus, all our computers are setup behind school networking hardware. This means that we do not have a direct connection to the internet and that all of our ports are stealthed and port forwarding is not possible. What if I forget some work at home and did not remember to toss it in my Dropbox folder?

What you’ve got to do is use reverse ssh. But what does that mean??? Well it’s simply this: You’ve got a server that you can ssh into. For me, I have both a webhost that provides shell accounts as well as friends who are willing to let me use their server for ssh access. The computer that you cannot access remotely will reverse ssh into this server and the computer you are using to access this is going to connect to the server and then to the unaccessible destination host.

So we’ve got a destination, an ssh server, and the client that wants to use the destination. To get started, we simply use ssh with the -R option. This will create a reverse ssh connection which simply means, ssh in and also set a localhost port so that to enable ssh back into the destination machine. We do this from the destination host as such:

`ssh IP -R 1337:localhost:22`

Let’s break this down. You’ve got a standard ssh connection to an IP address of the ssh server. Note that you may have to use extra information in order to specify the correct port and login information. Next we have “-R” which means to setup a reverse ssh tunnel. Then we have 1337:localhost:22. This means that if you ssh into localhost:1337 from the server you will be connected to port 22 of the destination host.

From here all you need to do is to simply ssh into the server from your client (typically a laptop that is out roaming around at a coffee shop or campus wifi). So we do that by a normal ssh connection to the server:

`ssh IP`

And once we are connected here, we ssh to localhost:1337:

`ssh localhost -p 1337`

This will be forwarded to port 22 of the destination host that was previously unreachable. And that’s it, you’re done! You can now access your destination target from anywhere.

For an added bonus, if you use port forwarding on the router the server is sitting behind (if you’ve got a server, you probably have a router ![:P][1] ) and forward port 1337 to the server, you can skip the step of ssh’ing into the server like normal and instead ssh into the server on port 1337 which will seamlessly be port forwarded to 22 of the destination host. Here’s an example ssh connection provided the server was having port 1337 forwarded to it:

`ssh IP -p 1337`

This will skip the step of ssh’ing into localhost for you and it will seem as if you connected directly to the destination. Happy hax0ring!

   [1]: http://excid3.com/blog/wp-includes/images/smilies/icon_razz.gif
