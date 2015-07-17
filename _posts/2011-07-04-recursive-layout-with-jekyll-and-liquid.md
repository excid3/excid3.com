---
title: Recursive Layout with Jekyll and Liquid
author: excid3
layout: post
dsq_thread_id:
  - 349354692
categories:
  - General
tags:
  - jekyll
  - layouts
  - liquid
  - recurisve
  - ruby
  - tree
---
I’ve been working a fair bit with [Jekyll][1] recently. I have to say, I love it. The flexibility and simplicity of it is great and works wonderfully if you want a static, and yet, easy to manage website. There is little that tops it in that respect.

Something I’ve wanted recently from it was a recursive layout. I wanted a tree style navigation menu. The best way to do this of course, would be to have a recursive include layout using Liquid. And yet, it wasn’t easy to find ANY working examples for this.

The documentation states that you can pass variables into the include statement for easy use, much like Rails partials. I fought and I fought, tears were shed, children were left injured, and still, Jekyll was having none of that.

My only working approach for building a recursive include was building the basic layout as such:

    <ul>{% raw %}
      {% for item in tree %}
        <li><a href="{{ item.href }}">{{ item.title }}</a></li>

        {% if item.subtree %}
          {% assign tree = item.tree %}
          {% include tree.html %}
        {% endif %}
      {% endfor %}
    {% endraw %}</ul>

The key things to note here are the assign statement and the include. You can take these two lines and put them into any main layout and replace `item.tree` with `page.tree` to have it use the page’s tree variable and this will recursively render the tree with liquid layouts.

From every single documentation page I saw, you could pass in the variable in the include statement. That didn’t work. AND they showed multiple ways of declaring which include to use. Those didn’t work either. I haven’t delved into Jekyll too much, but it’s certainly possible a slight configuration change is all that it needs to support Liquid’s actual functionality correctly. Either way, this works for lazy old me.

   [1]: http://jekyllrb.com
