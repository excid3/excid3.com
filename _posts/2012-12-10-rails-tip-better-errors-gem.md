---
title: 'Rails Tip: Better Errors Gem'
author: excid3
layout: post
dsq_thread_id:
  - 965935467
categories:
  - General
---
The default Rails error page is useful, however it can be a bear to tread through most times. There is so much output that we don’t usually need and on the other hand, there is a lot of other things we might need to see.

This is where [better_errors][1] comes in.

![better_errors gem][2]

The features of this are awesome:

  * Full stack trace
  * Source code inspection for all stack frames (with highlighting)
  * Local and instance variable inspection
  * Live REPL on every stack frame

Local and instance variable inspection is so useful, not to mention a live [REPL][3]!

This means that you can immediately see the instance variables that are set at the time of the error. You can even drill into the stack frames inside Rails to see what instance variables it was using to evaluate the action. The embedded source code is incredibly useful as well so that you can see what’s wrong immediately without having to dig through your application to find the offending line.

Quite the nifty gem! There are a handful of things that need work, such as the errors should also probably still be logged to the console. Since this only runs in development though, you will have the standard Rails errors you’re used to debugging with in the logs.

[better_errors on Github][4]

   [1]: https://github.com/charliesome/better_errors (better_errors)
   [2]: https://a248.e.akamai.net/camo.github.com/09c0e85b85d525d7a79757f1552248dae5c43dac/687474703a2f2f692e696d6775722e636f6d2f75725644572e706e67
   [3]: http://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop (REPL)
   [4]: https://github.com/charliesome/better_errors (Better Errors on Github)
