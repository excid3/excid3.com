---
title: 'Samba Issue &#8220;testparm&#8221; does not exist'
author: excid3
layout: post
dsq_thread_id:
  - 56181002
categories:
  - Ubuntu
tags:
  - issue
  - samba
  - testparm
---
Tonight I was fiddling around with my LAN and wanted to get samba running on my desktop’s Ubuntu Karmic 64bit installation so that I could watch [This Week In Startups][1] (best show ever btw) and listen to music on my laptops without having to copy files over. So, I fire up Keryx 1.0 pre-alpha on my work laptop and start to download the packages for samba. 4 packages, sounded right, exactly what APT wanted too. Installation went without a hitch, but when trying to share my media folder, I got an issue with something called “testparm”. Having no idea what this was, nor how to fix it, I figured I’d take a stab at it before googling. Sure enough, testparm is an application in samba-common-bin that was not installed as part of the required service. Makes a lot of sense right? Not at all. So basically, if you’ve got this issue, just install the samba-common-bin package and you’re good to go. Hopefully that gets added as a dependency soon and the issue wrapped up.

   [1]: http://thisweekinstartups.com/
