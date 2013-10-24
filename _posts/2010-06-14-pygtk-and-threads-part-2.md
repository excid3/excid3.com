---
title: PyGTK and Threads Part 2
author: excid3
layout: post
aktt_notify_twitter:
  - yes
  - yes
aktt_tweeted:
  - 1
dsq_thread_id:
  - 107748901
categories:
  - Python
tags:
  - gtk
  - pygtk
  - Python
  - threading
  - threads
---
If you’re just coming to this post, you may want to check out my introduction to threads in my previous post [PyGTK and Threads Part 1.][1]

Now that we have a better understanding of threads, let’s start learning with an example. You will need Python and PyGTK installed in order to run these.

The following code is the framework for the application we will be using. It’s very simple and consists of a window and a button. This code prints “Hello” into the terminal when the button is clicked so immediately after you click the button you can click it again and it works. This is because printing “Hello” is a very quick process.


    #!/usr/bin/env python
    #-*- coding:utf-8 -*-
    # By Chris Oliver
    # Adapted from http://www.pygtk.org/pygtk2tutorial/examples/helloworld.py

    import pygtk
    pygtk.require("2.0")

    import gtk

    class HelloWorld:
        def __init__(self):
            """
                Initializes the GTK application, in our case, create the window
                and other widgets
            """

            # Create a window
            self.window = gtk.Window(gtk.WINDOW_TOPLEVEL)
            self.window.set_border_width(10)

            # Setup the application to exit GTK when the window is closed
            self.window.connect("destroy", self.destroy)

            # Create a button
            self.button = gtk.Button("Hello World")

            # Make the button call self.hello() when it is clicked
            self.button.connect("clicked", self.hello)

            # Add the button into the window
            self.window.add(self.button)

            # Display the button and the window
            self.button.show()
            self.window.show()

        def hello(self, widget, data=None):
            print "Hello"

        def main(self):
            """
                This function starts GTK drawing the GUI and responding to events
                like button clicks
            """

            gtk.main()

        def destroy(self, widget, data=None):
            """
                This function exits the application when the window is closed.
                Without this the GTK main thread would continue running while no
                interface would be displayed. We want the application to exit when
                the window is closed, so we tell the GTK loop to stop so we can
                quit.
            """

            gtk.main_quit()

    if __name__ == "__main__":
        # Create an instance of our GTK application
        app = HelloWorld()
        app.main()

Go ahead and try it for yourself. You should get an application similar looking to this: ![][2]
Clicking the button prints “Hello” in the terminal and the interface is still usable.

Now what if we wanted to do something more? Maybe we wanted to…wait 20 seconds and THEN print “Hello”? Now that might cause some problems. Well let’s try it first. Just change the code to look like the following:


        def hello(self, widget, data=None):
            import time
            time.sleep(20)
            print "Hello"

Now execute it. What happens? When you click the button, it goes down like it was pressed, but does not come backup. The GUI stopped drawing as soon as the button was clicked. Resizing the window was no longer smooth, and dragging around the window erased the button and make it look something like this: ![][3]

Well, GTK was waiting to take control of your application again. You were busy forcing GTK to wait by sitting around fiddling your thumbs doing nothing for 20 seconds and then printing some text to the screen. Since you don’t take care of the drawing, you forced GTK to wait and made your application become unresponsive for a while. Users might think that your application has crashed, or at the very least they think its poorly written. And well…if you’re not using threads for long running tasks like this…then yes. It is poorly written.

So how do we do some simple threading? Doing two tasks at the same time sounds crazy complicated! Well, in reality, it certainly can be. However, as you begin to get the hang of things, it’s really not so bad.

First off, you need to initialize GTK Threads. I won’t go into detail on why this is necessary other than it’s required to setup GTK to use threads. You simply need to call “gtk.gdk.threads_init()” before the gtk.main() loop is called, so that’s pretty easy. There is a lot of things regarding threads that you need to be aware of, however this is just an introduction so I’m only going to mention what’s necessary. First off, when you have threads, they have access to all the variables in the program. This makes things easier, but unsafe. Think about this scenario: Two separate threads are running, but wish to modify the same variable, what happens? It’s impossible to tell. For this reason, you want to make sure that you NEVER update GTK from a secondary thread. This means you cannot make changes to ANYTHING related to the GUI in those separate threads.

Wait a minute, well then how am I going to do something like a progress bar? Won’t I have to update the GUI from that thread? Yes you will, but GTK provides you tools to do this in a safe manner. The gobject.idle_add() function does this for you. Woah woah woah, now what is gobject? Well, its the underlying architecture of GTK. The gtk.idle_add function has been deprecated in favor of using the direct gobject call. It’s best if you work with this directly but you don’t really need to know much about it for now other than it adds something to GTK’s todo list when it gets the chance. This lets you tell GTK to do things from external threads. GTK will be sitting around waiting to do something while your thread is hard at work. The thread can then tell it to update the progress bar occasionally and GTK will gladly do so safely.

So how do we apply these concepts to our existing application? Pretty simple as follows:


    #!/usr/bin/env python
    #-*- coding:utf-8 -*-
    # By Chris Oliver
    # Adapted from http://www.pygtk.org/pygtk2tutorial/examples/helloworld.py

    import pygtk
    pygtk.require("2.0")

    import gobject
    import gtk
    gtk.gdk.threads_init()

    import threading

    class HelloWorld:
        def __init__(self):
            """
                Initializes the GTK application, in our case, create the window
                and other widgets
            """

            # Create a window
            self.window = gtk.Window(gtk.WINDOW_TOPLEVEL)
            self.window.set_border_width(10)

            # Setup the application to exit GTK when the window is closed
            self.window.connect("destroy", self.destroy)

            # Create a button
            self.button = gtk.Button("Hello World")

            # Make the button call self.hello() when it is clicked
            self.button.connect("clicked", self.hello_helper)

            # Add the button into the window
            self.window.add(self.button)

            # Display the button and the window
            self.button.show()
            self.window.show()

        def hello(self, widget, data=None):
            import time
            time.sleep(5)
            print "Hello"

        def hello_helper(self, widget, data=None):
            print "starting new thread"
            threading.Thread(target=self.hello, args=(widget, data)).start()

        def main(self):
            """
                This function starts GTK drawing the GUI and responding to events
                like button clicks
            """

            gtk.main()

        def destroy(self, widget, data=None):
            """
                This function exits the application when the window is closed.
                Without this the GTK main thread would continue running while no
                interface would be displayed. We want the application to exit when
                the window is closed, so we tell the GTK loop to stop so we can
                quit.
            """

            gtk.main_quit()

    if __name__ == "__main__":
        # Create an instance of our GTK application
        app = HelloWorld()
        gtk.gdk.threads_enter()
        app.main()
        gtk.gdk.threads_leave()

As you can see, there were only small modifications. In this case we created a new function called hello_helper which executes our old hello function inside of a thread. When you click the button now, the thread is spawned quickly and execution continues back to the GTK loop almost immediately. You can click the button several times and many threads will be created and will execute simultaneously. We initialized GTK Threads at the very beginning at import just to make sure that it wasn’t forgotten, but standard practice is to put it just before gtk.main().

That’s about it. It’s a pretty introductory example, but I think it sufficiently explains the basics of threading. There are many more things to it and so I suggest reading up on it some more. Let me know if you have any questions or comments!

   [1]: http://excid3.com/blog/2010/06/pygtk-and-threads-part-1/
   [2]: http://excid3.com/blog/wp-content/uploads/2010/06/example.png (example)
   [3]: http://excid3.com/blog/wp-content/uploads/2010/06/example_busy.png (example_busy)
