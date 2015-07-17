---
title: Virtualenv, Pip, and Paver
author: excid3
layout: post
dsq_thread_id:
  - 55195836
categories:
  - Python
tags:
  - paver
  - pip
  - Python
  - virtualenv
---
Virtualenv, Pip, and Paver, my three new favorite python tools. These tools will considerably improve the quality and ease of building releases.

First off, [virtualenv][1]. This is a simple utility to create a sandbox for python development. What good is that? It means that you are able to contain all your python libraries within the working folder. This makes it easy for bundling the dependent libraries your project is using. Sweet huh? Installation and usage is simple, you can install it manually or use Ubuntu’s python-virtualenv package. Once you’ve got it installed, run `"virtualenv ."` in your project’s directory to set up virtualenv. Now when you want to work on the project, you simply run “`source bin/activate`” and your prompt will denote that you are using the tools from your virtual environment. Here is an example on my machine:

> `chris@cypher:~/Desktop/test$ virtualenv .
New python executable in ./bin/python
Installing setuptools............done.
chris@cypher:~/Desktop/test$ ls
bin include lib
chris@cypher:~/Desktop/test$ ls bin/
activate activate_this.py easy_install easy_install-2.6 python
chris@cypher:~/Desktop/test$ source bin/activate
(test)chris@cypher:~/Desktop/test$ which python
/home/chris/Desktop/test/bin/python
(test)chris@cypher:~/Desktop/test$`

Next we have [pip][2], like easy_install, it’s a nifty little utility for grabbing python packages. Instead of using easy_install, I choose pip. It downloads all the packages before installing so that you have less of an opportunity for installation to fail like easy_install does. Pip also provides a nifty little feature for keeping a requirements file containing a list of required packages for a project. For example, we could do the following to install wxpython for Keryx as such:

> `pip install wxpython`

Or we can do the following:

> `(staining)chris@cypher:~/Desktop/staining$ echo wxpython > requirements.txt
(staining)chris@cypher:~/Desktop/staining$ pip install -r requirements.txt`

This will check your python installation for the required packages. As well as providing easy package requirements installation for a project, you can also “freeze” the project to require the specific versions of the packages you are testing with. This can be handy if you are moving to a production environment and wish to bundle the libraries that are guaranteed to work properly.

Last, but certainly not the least useful, we have [Paver][3]. From the web page: “Paver is a Python-based software project scripting tool along the lines of Make or Rake. It is not designed to handle the dependency tracking requirements of, for example, a C program. It is designed to help out with all of your other repetitive tasks (run documentation generators, moving files about, downloading things), all with the convenience of Pythons syntax and massive library of code.” You can use this nifty tool to add things such as building of documentation as well as many other things. Paver also can interface with Virtualenv. If you’re willing to give up Pip, you could even use the virtualenv paver module to install the required packages with easy_install.

Well, that’s a small overview of a couple awesome tools in the plethora of python utilities out there. Check them out and be sure to start developing with them. Enjoy!

   [1]: http://pypi.python.org/pypi/virtualenv
   [2]: http://pypi.python.org/pypi/pip
   [3]: http://www.blueskyonmars.com/projects/paver/
