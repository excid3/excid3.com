---
title: 'Rails Tip #7: Mass Assignment Security'
author: excid3
layout: post
dsq_thread_id:
  - 604788633
categories:
  - Rails
---
I know everyone has been writing about this lately, so pardon yet another article on the pile, but this is a serious issue that people need to take into consideration daily.

Since the recent Github fiasco, there has been a lot of talk about security on the web. This was an [exceptional response][1] on their part, and something that every single one of us needs to take seriously instead of pointing fingers at people, companies, and frameworks.

Let’s dive into the vulnerability.

## Mass Assignment

When you create a form in Rails, you’re effectively mapping form values to a hash:


    
      
      

      
        
      

      
    


This hash’s values get assigned to the attributes of the Rails model you’re creating:


    Parameters:
    {
      "commit"=>"Submit",
      "post"=>{
        "title"=>;"First Post",
        "content"=>;"This is the content for the first post."
      }
    }


We access that in our controller’s create action:


    def create
      @post = Post.new params[:post]        # THIS IS THE IMPORTANT LINE

      if @post.save
        redirect_to @post, :notice => "Successfully created."
      else
        render :action => :new
      end
    end

    # Update is affected as well

    def update
      @post = Post.find params[:id]

      if @post.update_attributes params[:post]      # ALSO USES THE PARAMS HASH
        redirect_to @post, :notice => "Successfully updated."
      else
        render :action => :edit
      end
    end

On line 2 here, the params are passed into the new Post object. That is where the submitted form data is assigned to the model and then saved to the database.

**And that’s where the problem lies.**

By default, a user can update any attributes. So if you decide to allow users to be “admins”, then removing a field in the form that is for admins only is not good enough. A user can still submit the admin only param without permission.

## The solution: `attr_accessible`

The solution for this is `attr_accessible`. This method tells your model which attributes can be assigned via hash like in the `create` action we saw earlier.

Let’s do this by example. Pretend we don’t want people updating the `:important` attribute on a Post. What do we do?

The first thing, is that we should require `attr_accessible` be on all of our models. In `application.rb`, uncomment this line:


    config.active_record.whitelist_attributes = true

This no longer allows any of the attributes on any models to be set through mass assignment. That’s good.

Now we have to update the model to allow certain attributes:


    class Post < ActiveRecord::Base
      attr_accessible :title, :content
    end

When you try to attack the site by sending over a `:important` attribute, it will simply be ignored now. This is exactly what we want.

Rails will throw an exception in development if a protected attribute is attempted to be set. In production, no exception will be raised, the attribute will juts be ignored. That's a good start.

## What if we want some users to be able to set a protected attribute though?

In our case, let's say that we want admin users to be able to update the `:important` attribute. If attr_accessible doesn't allow us to save `:important`, then how do we actually set it??

Let's fix up the controller to allow this for users who are admins. We'll be using Devise with a boolean `:admin` column on the user so that is where `current_user` will be coming from.

Let's hop back in our controller and fix things up:


    def create
      # Remove the insecure item(s) so we don't throw an exception in development
      important = params[:post].delete :important

      # Create the new post as normal
      @post = Post.new(params[:post])

      # If the user is allowed update this attribute, explicitly set it
      @post.important = important if current_user.admin?

      if @post.save
        redirect_to @post, :notice => "Successfully created."
      else
        render :action => :new
      end
    end

    # Update is affected as well

    def update
      # Strip out the protected params so we don't throw exceptions in development
      important = params[:post].delete :important

      # Grab the post as usual
      @post = Post.find(params[:id])

      # Set the attributes like we do in create
      @post.attributes = params[:post]

      # Explicitly update the important attribute only if the user is an admin
      @post.important = important if current_user.admin?

      if @post.save
        redirect_to @post, :notice => "Successfully updated."
      else
        render :action => :edit
      end
    end


And this will allow any type of user to update the title and content attributes, but only admins are safely allowed to update the important field.

The important part to take note of here is that we are explicitly setting the protected attributes. We know **exactly** what we are doing when we want to set those attributes, so this (aside from logic problems) makes updating these attributes protected from mass assignment while still being usable.

Another important benefit of `attr_accessible` is that any new fields we add to the model are immediately protected. This whitelist approach makes sure that we have to declare fields as "safe" which leads to much fewer security holes when changing this code in the future because it forces you to not be forgetful.

## Conclusion

This is certainly a feature that will be updated in the future versions of Rails. The current solutions aren't exceptionally graceful, so I'm sure that we'll see some nice improvements soon.

In the mean time, keep with whitelisting attributes, and if have a lot of dynamic attributes that depend on the user roles, check out dynamic `attr_accessible` on [Railscast 237][2].

   [1]: https://github.com/blog/1068-public-key-security-vulnerability-and-mitigation
   [2]: http://railscasts.com/episodes/237-dynamic-attr-accessible
