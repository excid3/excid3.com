---
title: Custom Twitter Bootstrap Button Colors
author: excid3
layout: post
dsq_thread_id:
  - 1239541838
categories:
  - General
---
A lot of people are using Twitter Bootstrap these days and I can’t say I blame them. It’s incredibly easy to get a decent looking website built in just a few minutes and you can go back later and customize it to your liking. The problem is, a lot of people don’t take that second step and now you see a bunch of websites that all look generally the same.

One of the first and easiest steps you can take is customizing the colors of the Twitter Bootstrap buttons.

## Modifying Existing Twitter Bootstrap Button Colors

The simplest thing you can do is modify the default bootstrap button colors. Everyone is familiar with those colors and it makes it very easy to pick out a Twitter Bootstrap site because of these buttons.

![Screen Shot 2013-04-27 at 10.19.10 AM.pn][1]

Twitter Bootstrap uses a common set of naming schemes for the button colors in its LESS source and all we need to do is overwrite the colors like so:


    @btnSuccessBackground: #AAD023;
    @btnSuccessBackgroundHighlight: #6CBA2C;

    @btnPrimaryBackground: #7dc5ee;
    @btnPrimaryBackgroundHighlight: #008cdd;


This will change the `btn-success` and `btn-primary` button colors to give them a lighter feel and look like this:
![Screen Shot 2013-04-27 at 10.18.17 AM.pn][2]

## Creating A New Twitter Bootstrap Button Color

If you want to add a new button color, it’s incredibly simple for you to take Bootstrap’s internal LESS tools and generate a new class to use. Here we’ll be grabbing some colors from Facebook and creating a `btn-facebook` class to use. You’ll need to use LESS to compile this down to CSS. I’m using the twitter-bootstrap-rails gem to handle this for me.

The first step is to define your colors as you normally would in LESS. Creating the class is as simple as using the buttonBackground function.


    @facebookBlue:              #627aad;
    @facebookBlueDark:          #3b5998;
    .btn-facebook { .buttonBackground(@facebookBlue, @facebookBlueDark); }


Your resulting button will look like this, including hover and active states!

![Screen Shot 2013-04-27 at 10.02.31 AM.pn][3]

## Conclusion

Twitter Bootstrap button colors are overused, but they are easy to modify. Take some time to spruce up your site and soon enough you’ll end up with a unique site conveniently based on Twitter Bootstrap!

   [1]: http://cl.ly/image/3A3v2Y1i292L/Screen%20Shot%202013-04-27%20at%2010.19.10%20AM.png
   [2]: http://cl.ly/image/0t2t2P1m0v2g/Screen%20Shot%202013-04-27%20at%2010.18.17%20AM.png
   [3]: http://cl.ly/image/2z06143Q030g/Screen%20Shot%202013-04-27%20at%2010.02.31%20AM.png
