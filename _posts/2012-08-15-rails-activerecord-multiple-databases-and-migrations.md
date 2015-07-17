---
title: Rails ActiveRecord Multiple Databases And Migrations
author: excid3
layout: post
dsq_thread_id:
  - 806307437
categories:
  - General
---
Something we don’t see too much of is talk of using Ruby and ActiveRecord with multiple databases. Turns out it’s really simple. Let’s run through this.

## Rake Task

Let’s dive right in. Obviously we want to handle migrations for two databases, so we need two separate Rake tasks to handle that:


    desc "Migrate the database through scripts in db/migrate."
    namespace :db do
      task :migrate do
        Rake::Task["db:migrate_db1"].invoke
        Rake::Task["db:migrate_db2"].invoke
      end

      task :migrate_db1 do
        ActiveRecord::Base.establish_connection DB1_CONF
        ActiveRecord::Migrator.migrate("db/migrate/db1/")
      end

      task :migrate_db2 do
        ActiveRecord::Base.establish_connection DB2_CONF
        ActiveRecord::Migrator.migrate("db/migrate/db2/")
      end
    end


Our first task here is `db:migrate` that delegates out to `db:migrate_db1` and `db:migrate_db2`.

Each of those establish a connection to the database and then runs the migrations from their own separate folders. This allows you to store migrations in separate folders so you can easily manage them.

Your migrations are exactly the same as normal.

## Database Connections

In order to get those migrations to work, we need to configure the database connections. We’re going to define everything in the `database.yml` just like normal, but with a different naming convention:


    db1:
      development:
        adapter: mysql2
        database: db1_dev
        username: root

      test:
        adapter: mysql2
        database: db1_test
        username: root

      production:
        adapter: mysql2
        database: db1_prod
        username: root


    db2:
      development:
        adapter: mysql2
        database: db2_dev
        username: root

      test:
        adapter: mysql2
        database: db2_test
        username: root

      production:
        adapter: mysql2
        database: db2_prod
        username: root


Here we are configuration two separate databases `db1` and `db2`.

We need to configure our app to load these now. I typically do this in boot.rb, but if you’re using Rails this may go in your `application.rb` or environment file(s).


      ENV['ENV'] ||= 'development'

      db_conf = YAML::load(File.open(File.join(APP_PATH,'config','database.yml')))

      DB1_CONF = db_conf["db1"][ENV['ENV']]
      DB2_CONF = db_conf["db2"][ENV['ENV']]


So here, let’s take a look at what’s going on:

  1. We set the database configuration to use. Rails users can just use Rails.env here instead of `ENV['ENV']`
  2. Second we load up the database.yml config and parse it with YAML
  3. Lastly, we grab the configuration from the file for each db and the correct environment that we’re running in.

## Connecting Your Models

When you’re working with multiple databases, I like to explicitly setup the connections inside the models themselves instead of inheriting from ActiveRecord::Base and using subclasses.


    class Message < ActiveRecord::Base
      establish_connection DB1_CONF
    end


And our second model in another database:


    class User < ActiveRecord::Base
      establish_connection DB2_CONF
    end


## Conclusion

That's pretty much as simple as it is. All you really need to do is load the configurations, establish the database connections properly, and setup the migrations to load from a specific folder for each database.

I'm sure there are better ways of handling this, so if you have a suggestion, please let me know in the comments!