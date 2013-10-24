---
title: 'PyInstaller Followup &#8211; Building Python Executables on Windows'
author: excid3
layout: post
dsq_thread_id:
  - 55195860
categories:
  - Python
tags:
  - cross-platform
  - executable
  - pyinstaller
  - Python
---
In my previous post [PyInstaller – A Simple Tutorial][1], I walked through the basics of creating a single file executable of [Keryx][2] using Ubuntu and PyInstaller. This was a very smooth and straightforward approach to taking a python application and building it into a single file executable on Linux. Because Keryx is intended for use on many systems, which may or may not have Python and wxPython installed, it is idea of having a single file executable is definitely ideal. We’ve already built a single file executable for linux that includes both Python and wxPython in the previous post, but now we need to do the same thing on Windows. The steps are similar but I’m going to outline it all here for you.


**Step One** Getting PyInstaller

Just like we did before, download the latest version of PyInstaller. For this I went with the pre-release of 1.4 nightly snapshot. Download this, extract it and fire up your Windows command line. You can do this by going to Start->Run and typing “cmd”. I will be using Windows 7 for this. First we need to move into the pyinstaller directory like so:


    Microsoft Windows [Version 6.1.7600]
    Copyright (c) 2009 Microsoft Corporation.  All rights reserved.

    C:\Users\Chris Oliver>cd Desktop\pyinstaller-1.4
    C:\Users\Chris Oliver\Desktop\pyinstaller-1.4>

Because we are using Windows, all of Python is contained inside the python dlls. This means we don’t need to compile anything for pyinstaller on Windows like we had to on Ubuntu. We can simply jump straight to running the Configure script where it saves a configuration of all the available libraries on Windows that pyinstaller can make use of. We run that as such:


    C:\Users\Chris Oliver\Desktop\pyinstaller-1.4> python Configure.py

This command assumes that you have the python directory added to your system path. If you don’t have it, you will need to either manually specify the python.exe location or to add it to your system path manually. This isn’t in the scope of this post, but a quick google for it should clear up the issue for you easily.

**Step Two** – Making the specification

Now that we have pyinstaller configured, we can jump right into building the executable. Just as we did before, we run Makespec.py against the main python script, which in our case happens to be keryx.py. This generates a build configuration with all the options needed, so we specify them in the call. We will only be using the –onefile option which builds a single file executable since that is all we are interested in at the moment. Run the command similar to this:


    C:\Users\Chris Oliver\Desktop\pyinstaller-1.4> python Makespec.py --onefile "C:\Users\Chris Oliver\Desktop\keryx\keryx.py"
    wrote C:\Users\Chris Oliver\Desktop\pyinstaller-1.4\keryx\keryx.spec
    now run Build.py to build the executable

**Step Three** – Building the executable

Now we’ve got the spec, we’ve got the green light to build, and we’ve still got another half cup of coffee sitting here. What do we do now? Just what it tells us, run Build.py against the spec file and everything is ready to go.


    C:\Users\Chris Oliver\Desktop\pyinstaller-1.4> python Build.py keryx\keryx.spec

Once it’s done compiling, open up your pyinstaller-1.4/keryx/dist folder to be in awe of your newly compiled single file executable! You will still want to test this against multiple versions of Windows and especially ones without Python and wxPython installed (or your respective libraries you are using) and make sure that everything runs smoothly. So that is the basics, get out there and start building awesome cross platform python applications!

   [1]: http://excid3.com/blog/2009/12/pyinstaller-a-simple-tutorial/
   [2]: http://keryxproject.org
