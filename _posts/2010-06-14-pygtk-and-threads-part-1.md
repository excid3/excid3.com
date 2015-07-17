---
title: PyGTK and Threads Part 1
author: excid3
layout: post
aktt_notify_twitter:
  - yes
aktt_tweeted:
  - 1
dsq_thread_id:
  - 107727095
categories:
  - Python
tags:
  - gtk
  - pygtk
  - Python
  - threading
  - threads
---
Last semester I took a course called Operating Systems. We dove a bit into memory management, scheduling, and resource management. This was great and all, however our professor was a pushover when it came to projects. Sure we learned the concepts, but you can’t fully understand them until implementation, or at least that’s how it works for me. This summer I’ve been working on a couple projects in which threading is imperative. Last summer I attempted some threading well before I understood any of the concepts so I thought I would put together a blog post or two to introduce the subject a little simpler than some of the other posts I had tried to learn the subject on in the past.

To start this off, we must introduce threads. What’s a thread? Well it’s a lightweight process. Well what exactly is a process? It’s an application that is in memory. On a single CPU system, the operating system can only be executing one process at a time. In order for the computer to be interactive, it needs to execute a small portion of one process, jump to another, work for a bit, and go to the next. This happens quick enough that it appears the computer is doing multiple things at once. It’s not. Each time a process is swapped out of memory, the process needs to save its state, this means all the variables and everything else regarding the process so that it can resume exactly where it left off. Each process also is completely separate of each other. They do not share memory or anything.

Okay, so what is a thread exactly? Well a thread is a lightweight process. It shares the same memory space of the parent process so it also has access to the other threads’ variables. This isn’t possible with separate processes and also makes switching between threads significantly faster than switching between processes. In general, it is easier and simpler to write multi-threaded applications over multi-process ones.

Now that we’ve got an understanding of threads and processes, why do we need them? Have you ever used an application that freezes up while it’s doing something? This is when the developer should have launched a new thread to do the intense calculation. When you want to do two things at the same time, threads are important. This is especially important in graphical (GUI) applications. Why? Well you want the GUI to continue responding while you do your work don’t you? You don’t want it to freeze up do you? The user might think it’s a crappy application or something. Ever have an application that freezes up and you drag it around to see if its still working and the interface becomes blank? That’s because the GUI is not being updated. The thread for drawing the GUI is busy doing some other stupid calculation and leaving the user to freak out. Certainly not what you want right? Didn’t think so. In fact, if you don’t use threads, you couldn’t even use a progress bar to tell the user something was happening in the background.

What we want to do is apply these methods to GTK specifically. This idea works for just about any GUI toolkit including Qt, and wxWidgets, but we are going to keep this in terms of GTK for our purposes. So first off, you need to understand how a GTK application works. GTK provides a loop, that continually redraws the windows and accepts inputs. By default, it does nothing. It’s not until you, the developer, come along and give GTK some things to do. Maybe it’s drawing a window and a button. GTK knows what to do when you tell it what you want. It knows that you want it drawn so it does that for you. The mundane details don’t need to be worried about, you get to do the creative part and use this framework. Maybe you also want that button to do something when it’s clicked. GTK also gets notified of this. You tell it, hey, when someone clicks this button, can you execute this code for me? Thanks. It does this, but here’s the problem. GTK needs to be in it’s loop constantly waiting for input or changes from the user. It is “event driven”. This means that every time something happens, it needs to be ready and waiting to decide what to do. If you take too long in your custom code, GTK may not be able to get back in time to receive those inputs. If that happens, your application appears unresponsive and thats no good. I’ve made a simple mockup of GTK and how a developer’s code simply extends GTK in order to do what the developer wants.![][1]

Head on over to [Part 2][2] to start getting your hands dirty.

   [1]: http://excid3.com/blog/wp-content/uploads/2010/06/loop.png (loop)
   [2]: http://excid3.com/blog/2010/06/pygtk-and-threads-part-2/
