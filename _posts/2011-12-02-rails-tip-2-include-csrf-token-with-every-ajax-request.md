---
title: 'Rails Tip #2: Include CSRF Token With Every AJAX Request'
author: excid3
layout: post
dsq_thread_id:
  - 490983866
categories:
  - General
---
With Rails 3.1, and many other jQuery based apps you might end up doing some juggling with the CSRF token in your AJAX requests. You won’t always be submitting a form that includes the CSRF field, so this tip will include the CSRF token every request so you don’t have to worry about it.

First we want to make sure the CSRF token is stored in a meta tag inside the HTML head like so:


    

Next, we configure jQuery to always include the token in our requests:


    $(document).ajaxSend(function(e, xhr, options) {
      var token = $("meta[name='csrf-token']").attr("content");
      xhr.setRequestHeader("X-CSRF-Token", token);
    });


You can place this snippet of javascript anywhere, however I’d suggest keeping things clean and putting it inside your external javascript files.

Source:
