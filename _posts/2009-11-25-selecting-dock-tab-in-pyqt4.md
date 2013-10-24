---
title: Selecting dock tab in pyqt4
author: excid3
layout: post
dsq_thread_id:
  - 55195850
categories:
  - Python
---
For a project I have been working on recently, I came across the need to tabify the dock widgets I was using. The default addDockWidget function will add the widgets to the dock side by side which is not what I had wanted. tabifyDockWidget turned out to be what I was looking for, but when you tabify the widgets, the second one is selected. Looking through the documentation, I found nothing as to how I was supposed to select that specific tab, or how to even access the tab widget that was automatically created.

Doing a bit of googling really did not do me any justice until I came across a question about it on stackoverflow. It turns out that the widget needs only to be “raised” instead of selected. This naming scheme threw off my google fu until I landed on this question and found the answer. Here’s a snippet of my code inside a QMainWindow:


    # Make each widget a tab
    self.tabifyDockWidget(self.playbackDock, self.timeDock)

    # Select the first tab
    self.playbackDock.raise_()


And voila! The first tab is selected by default now. ![:D][1]

   [1]: http://excid3.com/blog/wp-includes/images/smilies/icon_biggrin.gif
