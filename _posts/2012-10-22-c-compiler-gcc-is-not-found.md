---
title: 'C compiler gcc is not found While Installing Passenger &#038; Nginx'
author: excid3
layout: post
dsq_thread_id:
  - 893864480
categories:
  - General
---
I’ve run into the “C compiler gcc is not found” issue before but I hadn’t written about it. I ran into the error again this morning, saw someone recently run into trouble [on Stack Overflow][1] so I thought I’d share the answer here as well. I only ran into this issue on Redhat Enterprise Linux, however depending on your Linux disk configuration, you may see this elsewhere.

## Oh no! “C compiler gcc is not found”

So the error comes from running `passenger-install-nginx-module` and looks like this:


    Compiling and installing Nginx...
    # sh ./configure --prefix='/opt/nginx' --with-http_ssl_module --with-http_gzip_static_module --with-cc-opt='-Wno-error' --add-module='/usr/local/lib/ruby/gems/1.9.1/gems/passenger-3.0.17/ext/nginx'
    checking for OS
       Linux 2.6.32-220.el6.x86_64 x86_64
    checking for C compiler ... not found

    ./configure: error: C compiler gcc is not found


For me, I already have gcc installed with Yum, so I know that’s not the problem. I got looking around and found [this thread][2] reporting the problem to be mounting /tmp as noexec.

## Fixing C compiler gcc is not found

The solution is very simple. Just remount the /tmp directory as exec.


    mount -o remount,rw,exec,nosuid /tmp
    passenger-install-nginx-module
    mount -o remount,rw,noexec,nosuid /tmp # Remount as noexec if you want


After remounting as exec, install passenger as normal. I ran into this issue on Redhat Enterprise Linux, but any Linux distro like CentOS, Ubuntu, or Debian could also have /tmp mounted as noexec as well. Not every distro mounts disks the same so you may find that it varies between them.

If this solution didn’t work for you, let me know in the comments. It’s also possible that your user doesn’t have gcc in their path or similar issue. If you’d like to read some more about the `noexec` option, check out this [Server Fault thread][3].

   [1]: http://stackoverflow.com/questions/12770501/c-compiler-gcc-not-found-while-installing-passenger-and-nginx/12998464#12998464
   [2]: https://groups.google.com/forum/?fromgroups#!topic/phusion-passenger/K2fWvsDq9_8
   [3]: http://serverfault.com/questions/72356/how-useful-is-mounting-tmp-noexec
