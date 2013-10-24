---
title: Installing PostgreSQL and pg gem on Mac OSX
author: excid3
layout: post
dsq_thread_id:
  - 252057818
categories:
  - Rails
tags:
  - empty
  - pg
  - postgresql
  - rails
  - test
---
Today I was fixing a bug in Rails 3.0.5 (hopefully it gets merged!) and I needed to build some test cases along with my patch. First of all, my original patch was making two db queries when it shouldn’t have been, so it was important that I had test cases to show the bug existed, as well as make sure it was doing the proper amount of querying. Secondly, the `empty?` function weren’t any test cases anyways, so it was nice that I was able to provide some basic test coverage for that as well. That’s probably why the issue slipped through several releases (appears to have been around since 3.0.0beta).

As this was my first contribution to Rails core, I needed to figure out how everything worked. The [Contributing To Rails Guide][1] is a great start and I was able to quickly fork Rails thanks to Github, clone it, make my patch, and then start running test cases. As soon as I tried to install the dependencies, I got an error trying to install the PostgreSQL gem, pg.


    No pg_config... trying anyway. If building fails, please try again with  --with-pg-config=/path/to/pg_config

Oh, yeah, I don’t have PostgreSQL installed yet. ![:-\)][2] I installed PostgreSQL from the [one click installer at EnterpriseDB][3].

Next attempt at `bundle install` (I am using [Bundler][4] instead of rubygems to install) gave me this:


    Building native extensions.  This could take a while...
    ERROR:  Error installing pg:
    ERROR: Failed to build gem native extension.

    /System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/bin/ruby extconf.rb install pg
    extconf.rb:1: command not found: pg_config --version
    ERROR: can't find pg_config.
    HINT: Make sure pg_config is in your PATH

The one click installer does not append the PostgreSQL bin directory to your path. You have two options, edit your bashrc and append the path permanently in there, or simply run `gem` or `bundle` with the PATH appended just before it like so:


    PATH=$PATH:/Library/PostgreSQL/9.0/bin/ bundle install
    or
    PATH=$PATH:/Library/PostgreSQL/9.0/bin/ gem install pg

That should do the trick. `pg` installed just fine after this and I was able to finish up my test cases and submit my patch! ![:D][5]

   [1]: http://edgeguides.rubyonrails.org/contributing_to_rails.html
   [2]: http://excid3.com/blog/wp-includes/images/smilies/icon_smile.gif
   [3]: http://www.enterprisedb.com/products-services-training/pgdownload#osx
   [4]: http://gembundler.com/
   [5]: http://excid3.com/blog/wp-includes/images/smilies/icon_biggrin.gif
