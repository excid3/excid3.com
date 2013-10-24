---
title: Logging Module Troubles
author: excid3
layout: post
dsq_thread_id:
  - 55195813
categories:
  - Python
tags:
  - logger
  - logging
  - Python
  - root
---
Recently I was helping mac9416 work on CLI parsing for the upcoming Keryx 1.0. He was running into some trouble with the logging module. What happened was that everything he was setting up for the logger was basically being overwritten with the defaults. The original code looked something like this, with libkeryx importing logging as well.

> `import logging, platform, sys
from optparse import OptionParser`
>
> LOG_FORMAT = '%(asctime)s %(levelname) %(message)s'
DATE = '%a, %d %b %Y %H:%M:%S'
>
> def parse(args=None):
""" Parses options and arguments passed """
parser = OptionParser(usage=USAGE, version='%s %s' % (PROGRAM, VERSION))
parser.set_defaults(log_level=logging.WARNING)
parser.add_option('-V', '--verbose', action='store_const', dest="log_level", const=logging.INFO, help='Show vervose output')
parser.add_option('-d', '--debug', action='store_const', dest="log_level", const=logging.DEBUG, help='Show debugging output')
return parser.parse_args()
>
> def main(argv=None):
""" Main function of execution """
import libkeryx
opts, args = parse()
print opts.log_level
logging.basicConfig(name=lib.appName, level=opts.log_level, format=LOG_FORMAT, date=DATE)


And this was giving the output as such:

> `ERROR:root:message`

This did not print any of our info or debug messages because it defaults to the ERROR logging level.What we were looking for was using the root logger across all modules so that we could have a single logging mechanism that would be easily set at the same level of any frontend. This wasn’t using our customized message format, nor was it using the proper logging level. It was set properly, but nothing was working correct.

After a bit of trial and error, I found the solution. In libkeryx, we were importing logging. The logging module was being first imported in the main python file, then it was being setup in libkeryx, and THEN it was being initialized with our basicConfig in the main file. This causes problems because logging is imported in multiple locations and is not configured beforehand. The solution? First thing, import logging, parse the CLI arguments and configure logging before you do anything else:

> `# Setup logging
import logging`
>
> def parse(args=None):
""" Parses options and arguments passed """
parser = OptionParser(usage=USAGE, version='%s %s' % (PROGRAM, VERSION))
parser.set_defaults(log_level=logging.WARNING)
parser.add_option('-V', '--verbose', action='store_const', dest="log_level", const=logging.INFO, help='Show vervose output')
parser.add_option('-d', '--debug', action='store_const', dest="log_level", const=logging.DEBUG, help='Show debugging output')
return parser.parse_args()
>
> opts, args = parse()
>
> LOG_FORMAT = '%(asctime)s %(levelname)-8s %(message)s'
DATE = '%a, %d %b %Y %H:%M:%S'
logging.basicConfig(level=opts.log_level, format=LOG_FORMAT, date=DATE)
>
> # Rest of imports go here
import libkeryx


What this does is allows us to configure the root logger before everyone else gets a hold of it. This gives it default properties of level, format, and date automatically to the other modules that use it, in our case, libkeryx. Order is key here, and because libkeryx is just a module, we want it to automatically inherit the logging level of the script importing it.