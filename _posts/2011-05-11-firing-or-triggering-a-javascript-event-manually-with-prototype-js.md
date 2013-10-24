---
title: Firing or Triggering a Javascript Event Manually with Prototype JS
author: excid3
layout: post
dsq_thread_id:
  - 301107185
categories:
  - General
  - Rails
tags:
  - event
  - fire
  - javascript
  - manual
  - prototype
  - trigger
---
As I was working recently, I ran across an issue with Prototype. I needed to use a lightbox library to display a dialog when the page was loaded. Normally we use this on image links and everything works dandy. The problem was that this time around, I needed the lightbox to be trigger on load of the page without user interaction.

The lightbox library I’m using doesn’t allow me to manually call the function because it works around events. In order to accomplish what I set out to do, I needed a way to manually trigger this event. Prototype JS doesn’t provide a method to create events.

What I found was a [nice post by Ben Christensen][1] talking about this exact problem. The code on his page creates a function that will trigger events cross browser. While that works all fine and dandy, what caught my eye and the implementation I used was this: [event.simulate.js][2]

The first implementation creates a function where you pass in an element and an event that you’d like to fire on it. However, with event.simulate.js, you can simply grab your element as normal and call `simulate()` on it like so:


    $('small').simulate('click');

This is a much cleaner syntax and works wonderfully well alongside prototype. Jquery has this functionality built-in so those of you who are lucky enough to have used that from the get-go don’t have to worry. Rails 3.1 is moving to Jquery by default so hopefully that simplifies a lot of things.

   [1]: http://benjchristensen.com/2010/08/28/trigger-native-javascript-events-with-prototype-js/
   [2]: https://github.com/kangax/protolicious/blob/5b56fdafcd7d7662c9d648534225039b2e78e371/event.simulate.js
