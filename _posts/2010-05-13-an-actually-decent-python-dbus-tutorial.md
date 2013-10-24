---
title: An actually decent Python DBus Tutorial
author: excid3
layout: post
aktt_notify_twitter:
  - yes
dsq_thread_id:
  - 95267207
categories:
  - Python
tags:
  - dbus
  - example
  - Python
  - tutorial
---
Recently for a website and backend daemon I have been building, I have come upon the need for a way to communicate between the two. Primarily it will just be the website needing to communicate to the backend when a user updates their page. Obvious choice for this is to use DBus, but looking around, the examples out there were pretty convoluted. I was only able to come across this one on a pastebin from the #bitbucket channel on freenode that made any sense to me:


    # myservice.py
    # simple python-dbus service that exposes 1 method called hello()

    import gtk
    import dbus
    import dbus.service
    from dbus.mainloop.glib import DBusGMainLoop

    class MyDBUSService(dbus.service.Object):
        def __init__(self):
            bus_name = dbus.service.BusName('org.frankhale.helloservice', bus=dbus.SessionBus())
            dbus.service.Object.__init__(self, bus_name, '/org/frankhale/helloservice')

        @dbus.service.method('org.frankhale.helloservice')
        def hello(self):
            return "Hello,World!"

    DBusGMainLoop(set_as_default=True)
    myservice = MyDBUSService()
    gtk.main()

    #######################

    # consumeservice.py
    # consumes a method in a service on the dbus

    import dbus

    bus = dbus.SessionBus()
    helloservice = bus.get_object('org.frankhale.helloservice', '/org/frankhale/helloservice')
    hello = helloservice.get_dbus_method('hello', 'org.frankhale.helloservice')
    print hello()


Now this example is relatively easy to understand. DBus’s API changes relatively often so I’ve made a couple changes from the original example paste that I found [here][1]. I am testing and running this on Ubuntu 10.04 LTS

First let’s take a look at myservice.py’s code. We import the necessary libraries and create a new class. This class is a service for DBus. This will be the object that gets activated when a DBus call is sent on this bus. We initialize the bus name and object in __init__ so it is ready to go.

Now that we successfully created a bus, we create a hello function that is accessible across the bus. We use a decorator to specify that it is a method available over the DBus service we created.

After that we have the main loop of the daemon. This code consists of setting the DBusGMainLoop as default which allows this script to receive DBus calls during the gtk.main loop that we run at the end. After we setup the main loop, we initialize the service and then jump right into our main loop.

Now that we have a DBus service running, we have to write a separate process that communicates with it. The consumeservice.py file is very short and concise when it comes to this. We use the SessionBus because our service is a session level daemon. We could use the SystemBus however it is reserved for more low level activities so we want to avoid that. Our service is easy to setup. We simply get_object with the same information we used to create the service and voila, we are connected to the service. From there, we need to specify which functions we wish to use from the service. These methods need to be fetched using the get_dbus_method call and passing the function name as the first parameter in a string. You assign the result to a variable which is callable from then on.

There you have it. DBus is actually pretty simple once you sift through all the messy examples lying around. Hopefully this helps and feel free to contact me if you have any questions.

   [1]: http://paste.lisp.org/display/45824
