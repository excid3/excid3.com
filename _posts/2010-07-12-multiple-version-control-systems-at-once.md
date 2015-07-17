---
title: Multiple Version Control Systems At Once!
author: excid3
layout: post
aktt_notify_twitter:
  - yes
  - yes
aktt_tweeted:
  - 1
dsq_thread_id:
  - 117167045
categories:
  - General
  - Hacking
  - Keryx
  - Ubuntu
tags:
  - bash
  - bazaar
  - bzr
  - git
  - script
---
For [Keryx][1], I have been working on a new backend system called [Unwrapt][2] (A play on words regarding the APT package system ![:P][3] ). I’ve been coding on github for the social coding aspects and keeping the branch on Launchpad.net as well to be part of Keryx’s page. This meant every time I wanted to commit and push, I’d have to do twice the amount of commands. Of course, being a lazy coder like the rest of us, I decided to script it. Fired up Gedit, and two seconds later I had this:


    #!/bin/bash

    bzr commit -m "$@"
    bzr push

    git commit -am "$@"
    git push origin master

Usage is simple (example is using this script saved in ~/vcs.sh). Just execute this from inside your versioned directory like you would normally with git and bazaar:


    $ sh ~/vcs.sh "first commit"

It pushes to your default branches (if you have any setup) in one strike using the commit message you pass to the script. Easy as that! I’m sure people might have some good ideas on features and improvements so leave them in the comments!

   [1]: http://keryxproject.org
   [2]: http://github.com/excid3/unwrapt
   [3]: http://excid3.com/blog/wp-includes/images/smilies/icon_razz.gif
