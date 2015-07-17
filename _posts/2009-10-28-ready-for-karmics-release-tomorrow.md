---
title: 'Ready for Karmic&#8217;s release tomorrow?'
author: excid3
layout: post
dsq_thread_id:
  - 55195842
categories:
  - Python
tags:
  - karmic
  - Python
  - Ubuntu
  - urlgrabber
---
As a typical Ubuntu release, I’m predicting the servers being hammered with traffic as Canonical releases their (at least imo) most stable release yet: Karmic Koala. So for a little bit of fun, I wrote a script to poll the server for the final release whenever it becomes available. This will check every 15 minutes to see if it is available, download the file and quit. Modifications can be made to resume the download (provided their servers support it, and I’m pretty sure they do) but I didn’t have the time to add that. This requires the python-urlgrabber package to be installed.


    import os.path
    import time
    import urlgrabber
    from urlgrabber.progress import TextMeter

    progress = TextMeter()

    release = 'ubuntu-9.10-desktop-amd64.iso'
    server = 'http://releases.ubuntu.com/releases/9.10/'

    print "Downloading %s%s" % (server, release)

    while not os.path.exists(release):
        try:
            urlgrabber.urlgrab(server   release, progress_obj=progress)
        except:
            print "Not available yet...Checking again in 15 minutes"
            time.sleep(900) # Wait 15 minutes before checking again
