---
title: 'Rails Tip: Adding Password Complexity Validations To Devise'
author: excid3
layout: post
dsq_thread_id:
  - 842581819
categories:
  - Rails
---
This is a quick tip for adding complexity to Devise passwords. None of this is very special, but I thought it would be good to write about considering there is a lack of documentation on how people would go about implementing this.

Here we have a typical Devise user model. What’s new is the password complexity validation.


    class User < ActiveRecord::Base
      devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
      attr_accessible :email, :password, :password_confirmation, :remember_me,

      validate :password_complexity

      def password_complexity
        if password.present? and not password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d). /)
          errors.add :password, "must include at least one lowercase letter, one uppercase letter, and one digit"
        end
      end
    end


This is exactly like your typical custom validation. The only exception is that it validates the password format only when the password is present. Since the password attribute in a Devise model only exists when you are creating a user, and only when you're updating a user, you can't perform this validation every time.

As for the regex, it uses positive look aheads to check for a lowercase letter, uppercase letter, and a digit. Each of those is required for validation. I found [this nifty regex][1] on Stack Overflow.

If you'd like some more advanced security, you can use the [Devise Security Extension][2] which provides the above functionality and a whole lot more.

   [1]: http://stackoverflow.com/questions/1559751/regex-to-make-sure-that-the-string-contains-at-least-one-lower-case-char-upper (RegEx to make sure that the string contains at least one lower case char, upper case char, digit and symbol)
   [2]: https://github.com/phatworx/devise_security_extension
