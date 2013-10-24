---
title: Simple Python Plugin System
author: excid3
layout: post
aktt_notify_twitter:
  - yes
aktt_tweeted:
  - 1
dsq_thread_id:
  - 104753985
categories:
  - Python
tags:
  - decorators
  - plugin
  - Python
  - system
---
Working on the upcoming version of Keryx, we’ve gained some interest in making Keryx support many different Linux distributions. This means we will have to support other package management systems, more than simply APT. A sort of plugin system is needed for this and it would need to be easy to use. Our frontends to this library will need to determine what features are available so the interface can be modified accordingly. So how do you approach this without making it terribly complicated?

Well first off we want to make sure the plugins load from a specific folder. I decided to make plugins be either single files or full directories. If the option to use a full directory is used, the __init__.py file must contain the plugin description info and primary class. In order to keep this easily maintainable, the plugin manager is simply a class that contains a dictionary of the plugins. Numerous instances of the plugins can be created as well as separate plugin systems (for example, maybe you were wanting to do a backend plugin system and a separate frontend plugin system). Creating multiple instances of a plugin is also important. We do this by keeping the module stored in the manager instead of an instance. This way the manager is simply a way to find and create instances of plugins.

Here’s a prototype of what I have described here, reasonably well commented. I called them “definitions” instead of “plugins” in case you were wondering:


    import logging
    import os
    import sys


    class DefinitionManager:
        """Definition Manager

        Loads the definitions from a folder and manages them
        """


        definitions = {}


        def __init__(self, folder):
            """Load all available definitions stored in folder"""

            #TODO: User path and variable expansions
            folder = os.path.abspath(folder)

            if not os.path.isdir(folder):
                logging.error("Unable to load plugins because '%s' is not a folder" % folder)
                return

            # Append the folder because we need straight access
            sys.path.append(folder)

            # Build list of folders in directory
            to_import = [f for f in os.listdir(folder) if not f.endswith(".pyc")]

            # Do the actual importing
            for module in to_import:
                self.__initialize_def(module)


        def __initialize_def(self, module):
            """Attempt to load the definition"""

            # Import works the same for py files and package modules so strip!
            if module.endswith(".py"):
                name = module [:-3]
            else:
                name = module

            # Do the actual import
            __import__(name)
            definition = sys.modules[name]

            # Add the definition only if the class is available
            if hasattr(definition, definition.info["class"]):
                self.definitions[definition.info["name"]] = definition
                logging.info("Loaded %s" % name)


        def new_instance(self, name, *args, **kwargs):
            """Creates a new instance of a definition
            name - name of the definition to create

            any other parameters passed will be sent to the __init__ function
            of the definition, including those passed by keyword
            """
            definition = self.definitions[name]
            return getattr(definition, definition.info["class"])(*args, **kwargs)



I’ve used this approach for backend plugins on Unwrapt, a platform independent package management system emulator. To see my up-to-date implementation head  over at http://github.com/excid3/unwrapt in DefinitionManager.py.

Leave a comment if you have any questions or suggestions.