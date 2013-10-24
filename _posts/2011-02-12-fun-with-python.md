---
title: Fun with Python
author: excid3
layout: post
dsq_thread_id:
  - 229025688
categories:
  - Python
---
I’ve used Python fairly actively for the past 4 years. Being entirely self taught on it, I’m rather certain I’ve been missing out on quite a lot of nice functionality. Most of my time has been spent writing my own Python code, and much less reading others. Which I’m sure has left me in a pretty poor state, as I think there are a lot of features that I could (and should) be using to write cleaner code.

Today I realized Python has class variables. It makes total sense, since many other languages have it, and otherwise you would have to use a global, but I never thought about using one:

Another sweet trick is using the `map` function to iterate over a list, and pass each item into a function. You could create the same two people like this:


    map(Person, ["chris", "bob"])


Another thing I discovered recently, that I really really love, is chaining comparison operators.


    if 10 