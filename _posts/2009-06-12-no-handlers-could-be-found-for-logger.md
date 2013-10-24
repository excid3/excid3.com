---
title: No handlers could be found for logger
author: excid3
layout: post
dsq_thread_id:
  - 55195778
categories:
  - Python
---
This is a common python lib issue that I have seen across the border. The issue spawns from libraries be written to use the logging module however it has not been configured throwing a message into the terminal that looks like this:





“library” is the name of whatever you are using that uses the logging module and does not look to see if the module is configured or not. As an example, using the python-elements library, I was getting `No handlers found for logger "elements"` in my code.

So how do we fix this? Simple, in your python code that imports this module, just make sure you do the following:


    import logging
    logging.basicConfig()

What this does is imports the same logging module as the library does and it sets up a configuration application wide that the plugin’s logging import can use to write messages properly.