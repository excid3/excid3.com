---
title: Removing the Version Number from Novaboard
author: excid3
layout: post
dsq_thread_id:
  - 55195770
categories:
  - News
---
[Keryx][1] has gotten a new forum, one that is more secure, uses recaptcha and less easily spammed by forum bots. The forum software I am using is called NovaBoard. It is a very simple and clean forum but I did not like it displaying its version number in the copyright footer so I removed it. Of course this was against the license agreement and I was soon notified of the offense. Discussing the reasons for removing it with one of the developers, we decided to keep the “Powered by Novaboard” and to remove the version number at the bottom. This would at least make it slightly tougher for attackers to search for exploits for that specific version of Novaboard. Yes it is [security theatre][2] but it can help to prevent skiddies from attacking your sites.

To remove the version number from your Novaboard install, edit the /lang/english_en/lang_forum.php file and change the following line:
[code]'footer_copyright' => "Powered by NovaBoard v",[/code]
to
[code]'footer_copyright' => "Powered by NovaBoard",[/code]

   [1]: http://keryxproject.org
   [2]: http://en.wikipedia.org/wiki/Security_theatre
