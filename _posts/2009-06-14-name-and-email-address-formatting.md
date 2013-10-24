---
title: Name and Email Address formatting
author: excid3
layout: post
dsq_thread_id:
  - 55195780
categories:
  - GSoC
---
It is an accepted specification to use the [RFC 822 standard][1] for formatting names and email addresses. Widespread usage of RFC 822 means that we should definitely try to provide support for this in WinLibre’s metadata. Here’s an example formatted name/email combo in RFC 822:

> John Smith 

This, however, will not work smoothly with our usage of XML formatting in our metadata documents. Python-elements throws errors when it comes to the email portion as it interprets the section as an improperly formatted XML element. What can we do to fix this? Simple, just replace “” with “. To provide compatibility, we can provide a function to convert to and from RFC 822 format and we can also add support for extracting just the name or email from the string as well. Here is our previous example in the new format:

> John Smith “example@webiste.com”

This quickly and easily fixes the issue with XML parsing and can easily be converted back and forth. Only the last two double quotes (“) in the string will be worked with. This eliminates issues that could be caused with the name portion of the string being accidentally manipulated if it were to contain extra characters that required quotation marks. Take this for example:

> “Smith, John” 

In order to conver this to our format, we only replace “” with double quotes to get this:

> “Smith, John” “example@website.com”

Now in order to change back to RFC 822 format, we trim the last character off (which is the last double quote) and replace it with a “>”. Then we find the index of the new _last_ double quote and replace that one with a “