---
title: Random Mac Address on Start Up with Ubuntu
author: excid3
layout: post
dsq_thread_id:
  - 55195795
categories:
  - Hacking
tags:
  - mac address
  - random
  - start up
  - Ubuntu
---
This is more of just a tutorial on how to run something as root in a start up script for Ubuntu. We will use the application macchanger as our example application that we want to run on boot. What do we have to do? For Ubuntu, we need to create a new script with `sudo gedit /etc/init.d/macchanger` and use these as the contents:


    #!/bin/bash

    # Disable the network devices
    ifconfig eth0 down
    ifconfig wlan0 down

    # Spoof the mac addresses
    /usr/bin/macchanger -r eth0
    /usr/bin/macchanger -r wlan0

    # Re-enable the devices
    ifconfig eth0 up
    ifconfig wlan0 up


Now that we have a script created in the /etc/init.d/ directory we need to set executable permissions on it by executing:

> `sudo chmod x /etc/init.d/macchanger`

After this we need to enable the boot script with:

> `sudo update-rc.d macchanger defaults 10`

Now, if everything went as planned, check your real mac address, reboot and compare to your new random mac on boot! Enjoy!