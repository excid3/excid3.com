---
title: Git Status In Your Command Prompt
author: excid3
layout: post
dsq_thread_id:
  - 361541663
categories:
  - General
  - Hacking
tags:
  - bash
  - colors
  - git
  - prompt
  - status
---
The more you start working with Git, the more you’ll want to become a Git Grand Master and join the ranks of Linus Torvalds. Typing `git status` all the time not only wastes away the precious hours of your life, but its certainly no way to impress your coworkers, convince your boss that you came from another universe, and certainly won’t impress the cute secretary.

But what if…just what if…you could integrate it into your command prompt? That might be the final straw so you can get a raise AND a girlfriend right?? Hell yeah! Let’s do this!


    # http://henrik.nyh.se/2008/12/git-dirty-prompt
    # http://www.simplisticcomplexity.com/2008/03/13/show-your-git-branch-name-in-your-prompt/
    # username@Machine ~/dev/dir[master]$ # clean working directory
    # username@Machine ~/dev/dir[master*]$ # dirty working directory

    function parse_git_deleted {
      [[ $(git status 2> /dev/null | grep deleted:) != "" ]] && echo "-"
    }
    function parse_git_added {
      [[ $(git status 2> /dev/null | grep "Untracked files:") != "" ]] && echo ' '
    }
    function parse_git_modified {
      [[ $(git status 2> /dev/null | grep modified:) != "" ]] && echo "*"
    }
    function parse_git_dirty {
      # [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "☠"
      echo "$(parse_git_added)$(parse_git_modified)$(parse_git_deleted)"
    }
    function parse_git_branch {
      git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
    }
    export PS1='\w$(parse_git_branch)$ '

What is this I don’t even? Okay, well, you need to put this in your .bash_profile or .bashrc file. Re-open your terminal and you’ll have your new sweet prompt all ready to go. When you’re in a git directory this code will execute and you’ll get a neat little addition that shows your current branch, additions, deletions, and modifications.

![][1]

How sweet is that? Here we’ve got a screenshot of my prompt in the Fluttrly [source][3] directory. (Subtle advertisement here for contributions to Fluttrly)

Provided you actually use git to a tiny bit of its potential, this is really awesome. If you don’t, well, why don’t you go use Visual Studio, we don’t want you here I guess now is the time to learn. Works on any bash prompt with colors enabled.

Of course you could just use [zsh][4] for all this, but that’s for another time.

Okay, so maybe this isn’t the coolest thing in the world, but it is pretty freakin handy. Comment if you have a cool prompt you’d like to share. I need to get my nerd cred up at work.

   [1]: http://excid3.com/blog/wp-content/uploads/2011/07/Screen-shot-2011-07-03-at-10.20.46-PM.png (Screen shot 2011-07-03 at 10.20.46 PM)
   [2]: http://fluttrly.com
   [3]: http://github.com/excid3/fluttrly
   [4]: http://zsh.sourceforge.net/
