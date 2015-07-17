---
title: Resume downloads with PycURL RESUME_FROM
author: excid3
layout: post
aktt_notify_twitter:
  - yes
aktt_tweeted:
  - 1
dsq_thread_id:
  - 106903541
categories:
  - Keryx
  - Python
tags:
  - curl
  - libcurl
  - pycurl
  - resume
  - resume_from
---
If you’ve ever played with urllib, you might have noticed its reasonably slow download speeds and wanted something a little bit more. That’s where cURL comes into play. It’s a very powerful library and is used in applications such as Gwibber. Seeing that this ships with Ubuntu, it is a good fit for Keryx’s new backend library Unwrapt.

I spent yesterday working on this new downloading code and wanted to share my code as I found the documentation (in reality, the entire library too) is primarily in C style and confusing examples. This is an easy to use class that helps to take care of some of the mundane details like following redirects (which is important! if you don’t enable this you won’t be able to reach a lot of files). I plan on extending this to support proxies soon as well as a GTK progress function.


    #    Unwrapt - cross-platform package system emulator
    #    Copyright (C) 2010 Chris Oliver
    #
    #    This program is free software: you can redistribute it and/or modify
    #    it under the terms of the GNU General Public License as published by
    #    the Free Software Foundation, either version 3 of the License, or
    #    (at your option) any later version.
    #
    #    This program is distributed in the hope that it will be useful,
    #    but WITHOUT ANY WARRANTY; without even the implied warranty of
    #    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    #    GNU General Public License for more details.
    #
    #    You should have received a copy of the GNU General Public License
    #    along with this program.  If not, see .


    import math
    import pycurl
    import os
    import time
    import sys


    class EasyCurl:


        def __init__(self, proxy=None):

            self.pco = pycurl.Curl()
            self.pco.setopt(pycurl.FOLLOWLOCATION, 1)
            self.pco.setopt(pycurl.MAXREDIRS,      5)
            #self.pco.setopt(pycurl.TIMEOUT,       5*3600)
            self.pco.setopt(pycurl.CONNECTTIMEOUT, 30)
            self.pco.setopt(pycurl.AUTOREFERER,    1)

            #TODO: Proxy!


        def perform(self, url, filename=None, resume=True, progress=None):

            # Generate filename if not given
            if not filename:
                filename = url.strip("/").split("/")[-1].strip()
            self.filename = filename

            # Get resume information
            self.existing = self.start_existing = 0
            if resume and os.path.exists(filename):
                self.existing = self.start_existing = os.path.getsize(filename)
                self.pco.setopt(pycurl.RESUME_FROM, self.existing)

            # Configure progress hook
            if progress:
                self.pco.setopt(pycurl.NOPROGRESS,       0)
                self.pco.setopt(pycurl.PROGRESSFUNCTION, progress)

            # Configure url and destination
            self.pco.setopt(pycurl.URL, url)
            self.pco.setopt(pycurl.WRITEDATA, open(filename, "ab"))

            # Start
            self.pco.perform()

            sys.stdout.write("n")


        def textprogress(self, download_t, download_d, upload_t, upload_d):

            downloaded = download_d   self.existing
            total      = download_t   self.start_existing
            try:    frac = float(downloaded)/float(total)
            except: frac = 0

            bar = "=" * int(25*frac)

            sys.stdout.write("r%-25.25s %3i%% |%-25.25s| %5sB of %5sB" %
                (self.filename,
                 frac*100,
                 bar,
                 format_number(downloaded),
                 format_number(total)))


    # Borrowed from the urlgrabber source
    def format_number(number, SI=0, space=' '):
        """Turn numbers into human-readable metric-like numbers"""
        symbols = ['',  # (none)
                   'k', # kilo
                   'M', # mega
                   'G', # giga
                   'T', # tera
                   'P', # peta
                   'E', # exa
                   'Z', # zetta
                   'Y'] # yotta

        if SI: step = 1000.0
        else: step = 1024.0

        thresh = 999
        depth = 0
        max_depth = len(symbols) - 1

        # we want numbers between 0 and thresh, but don't exceed the length
        # of our list.  In that event, the formatting will be screwed up,
        # but it'll still show the right number.
        while number > thresh and depth < max_depth:
            depth  = depth   1
            number = number / step

        if type(number) == type(1) or type(number) == type(1L):
            # it's an int or a long, which means it didn't get divided,
            # which means it's already short enough
            format = '%i%s%s'
        elif number < 9.95:
            # must use 9.95 for proper sizing.  For example, 9.99 will be
            # rounded to 10.0 with the .1f format string (which is too long)
            format = '%.1f%s%s'
        else:
            format = '%.0f%s%s'

        return(format % (float(number or 0), space, symbols[depth]))


    if __name__ == "__main__":
        url = "http://launchpad.net/keryx/stable/0.92/ download/keryx_0.92.4.zip"
        ec = EasyCurl()
        ec.perform(url, progress=ec.textprogress)
