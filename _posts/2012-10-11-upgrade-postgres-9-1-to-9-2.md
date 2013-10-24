---
title: Upgrade Postgres 9.1 to 9.2
author: excid3
layout: post
dsq_thread_id:
  - 881158281
categories:
  - General
---
This is a really quick guide to upgrade postgres 9.1 to 9.2. I recently used homebrew to upgrade them, and I realized I could no longer start the postgres server. For me, I was able to find the error causing it in `/usr/local/var/postgres/server.log`:

> FATAL: database files are incompatible with server
DETAIL: The data directory was initialized by PostgreSQL version 9.1.4, which is not compatible with this version 9.2.1.

## The Solution

First things first, if you have any production data, make sure you **make a full backup** before following any of the steps below.

It’s relatively painless to upgrade Postgres 9.1 to 9.2, although I would have hoped that homebrew would have notified me of this problem and helped me through the upgrade.


    cd /usr/local/var
    mkdir postgres9.2

    # Initialize a the new postgres 9.2 database
    initdb /usr/local/var/postgres9.2

    # Tell postgres we are upgrading the existing postgres database to the new postgres9.2 location
    pg_upgrade -d /usr/local/var/postgres/ -D /usr/local/var/postgres9.2 -b /usr/local/Cellar/postgresql/9.1.4/bin/ -B /usr/local/Cellar/postgresql/9.2.1/bin/ -v

    # Swap the folders
    mv postgres postgres9.1.4
    mv postgres9.2 postgres

    # Remove this unnecessary helper file
    rm delete_old_cluster.sh

    # Restart postgres
    launchctl unload -w homebrew.mxcl.postgresql.plist
    launchctl load -w homebrew.mxcl.postgresql.plist


And you’re done. It’s really simple to upgrade postgres 9.1 to 9.2. If you’re on different versions, just swap out the numbers and you should be fine. There is some [useful documentation][1] for the `pg_upgrade` command that I would recommend checking out as well. Better safe than sorry, especially if you are upgrading a database in production.

   [1]: www.postgresql.org/docs/current/static/pgupgrade.html (pg_upgrade)
