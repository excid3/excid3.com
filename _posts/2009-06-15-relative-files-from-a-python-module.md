---
title: Relative files from a Python module
author: excid3
layout: post
dsq_thread_id:
  - 55195783
categories:
  - Python
---
Today I took a little break and began layout out the foundation for [Keryx][1] once again. This time the goal is to be very open and test driven. The first thing on my todo list was make sure that Libkeryx could be imported from anywhere and it would still only use the plugins located in the plugins folder which is inside the libkeryx module. But how do we go about doing this? Relative paths will not work because we would have to be working in the libkeryx directory for files in the folder to be imported properly.

The solution? Use __file__ from inside the library. This is a variable that is setup upon importing a module that contains the path to the module. Perfect! Now we can access files relative to the module from inside of the module itself by joining the paths with the __file__ variable. Simple as that and kind of an obscure thing to search for but certainly a common task among modules.

   [1]: http://keryxproject.org
