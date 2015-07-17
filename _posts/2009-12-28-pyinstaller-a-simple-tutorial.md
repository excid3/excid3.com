---
title: 'PyInstaller &#8211; A simple tutorial'
author: excid3
layout: post
dsq_thread_id:
  - 55195858
categories:
  - Python
tags:
  - pyinstaller
  - Python
---
So you’d like to package your app for Windows, Linux, and even possibly OSX with using a single build tool? [PyInstaller][1] catch your eye? This will be a short walk through of all the steps I have taken to get PyInstaller working for the [Keryx ][2]0.92 branch. Basic knowledge of traversing using the command line is necessary.

First off, you’re going to need Python 2.5. Since Python 2.6, there have been some significant changes to Python where it creates some build issues for Windows users. We are going to use 2.5 to avoid those. The first section here will be on Ubuntu Linux, to create a single file executable for Linux users. Assuming you are on a version of Ubuntu running Python 2.6 or later, you will need to install python2.5 and follow the respective steps running it instead of the default python version. If you are running something with python2.5 you can skip those steps where appropriate. I haven’t tested this with versions of Python before 2.5.

**Step One** – Installing Dependencies

Fire up a terminal and install python2.5 build-essential python-dev zlib1g-dev by running the following command:


    sudo apt-get install python2.5 build-essential python-dev zlib1g-dev

From now on, to run your python scripts, use “python2.5″ instead of simply “python” in order to make sure things will compile properly.

**Step Two** – Building PyInstaller

Next up we have to grab a copy of PyInstaller to install. The version I installed as 1.4 from trunk because PyInstaller 1.3 has been out of date for some time now. Grab the latest from their website: 

Extract this and cd into the directory where you extracted PyInstaller. Once there, cd into source/linux and run the following commands:


    python2.5 ./Make.py
    make
    cd ../..
    python2.5 Configure.py

This will build pyinstaller and configure it to know the available libraries that you have installed such as UPX and unicode support.

**Step Three** – Creating the specification

For each application you package, you must create a specification for it. This is basically a configuration file that keeps track of the different options “specified” for the project. You can set options like a single file executable, file icon, and other features. We are only going to go with a single file executable for this one:


    python2.5 Makespec.py --onefile /home/chris/keryx_stable/keryx.py

**Step Four** – Building the executable

Now that we have the specification built, we can use that to build the executable. This is a simple step, just run the Build.py script and pass it the spec file that was created. Our script is located at pyinstaller/keryx/keryx.spec so we run the following command:


    python2.5 Build.py keryx/keryx.spec

Now you can check the pyinstaller/keryx/dist folder for your hot-off-the-press Keryx linux single file executable!

The only issue I have experienced with this method was our dynamic plugin module that loads plugins at runtime. These files must be added to the Analyses() function in the pyinstaller spec in order for them to be parsed for any special libraries they might be importing to not go overlooked. If they were missed, the plugin would fail to load because it was missing libraries.

Hope that helps explain the basics. Everything else can be fairly easily found on the PyInstaller Manual pages but if you have any questions, feel free to leave a comment or shoot me an email. Check back soon for my next tutorial building Keryx for Windows using PyInstaller.

   [1]: http://www.pyinstaller.org/
   [2]: http://keryxproject.org
