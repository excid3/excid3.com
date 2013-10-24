---
title: 'Simpyl Pastebin &#8211; A minimal Python Pastebin'
author: excid3
layout: post
dsq_thread_id:
  - 55195863
categories:
  - Python
tags:
  - pastebin
  - Python
---
Tonight I needed to relax a bit and figured what better way than to take a straight caffeine injection, fire up the old ‘puter, and hammer out an [extremely simple pastebin ][1]using Python and Django. I wanted this project to be an example for others to get the basic idea of a pastebin, Python, and Django as well. So why wait, let’s jump right in.

First of all, with Django, we have the basic project. The project is the top level directory files: manage.py (controls the Django application), urls.py (contains the url configurations), settings.py (contains the application settings), and __init__.py (which just kind of sits there and looks pretty so that importing works).

First, a quick rundown of the configuration. We are using sqlite3 currently. This is a relation database that is stored in a file meaning that you will not need an sql database server running. All the data will be stored in the database file (by default is simpyl.dat) meaning that you can actually copy the directory and everything will move with it as opposed to having it on a remote sql database server.

In urls.py we have the following code:


        (r'^$', 'simpyl_pastebin.pastebin.views.main'),
        (r'', 'simpyl_pastebin.pastebin.views.fetch_paste'),

This is fairly self explanatory. Basically the regex’d url on the left will be sent to the module function that is on the right. First we have the root domain pointing to the pastebin/views.py main() function. The next line takes absolutely any url that wasn’t already done and uses the fetch_paste function.

Before we get to the view functions that handle the actual pages, let’s take a look at our database table. This is located in pastebin/models.py, but I’ll paste the code here as well:


    from django.db import models

    class Paste(models.Model):
        content = models.CharField(max_length=1000000)
        url = models.CharField(max_length=32)

This declares the “paste” table in our database. Object-Relational Mapping is used to map a table to objects of a class. Our Paste class is the object that is created and retrieved for each paste and retrieval. It has two properties, the actual paste content, and the url. The url is a simple md5 hash of the content to make for easy url generation. What we will do in the fetch_paste function is to take the url someone is trying to visit, see if it matches a url from the paste table and if it does we display that paste’s content. If it doesn’t we send them back to the homepage.

Now that we have the basic understand of the structure of the site, we need to actually implement it and get the logic working. First let us take a look at the logic behind the site home in the main() function:


    def main(request):
        previous = request.POST.get('paste', '')

        if previous:
            id = hashlib.md5(previous).hexdigest()

            try:
                Paste.objects.get(url=id)
            except:
                p = Paste(content=previous, url=id)
                p.save()

            previous = 'http://%s/%s' % (request.get_host(), id)

        t = loader.get_template('pastebin/templates/index.html')
        c = Context({
            'previous': previous
        })

        return http.HttpResponse(t.render(c))

If you look through the index.html page that is rendered, we see that the textarea has a name of “paste”. So in the first line of this function, if we find that the page was submitted and there was something in the textarea we want to retrieve it, or if not, populate the variable with an empty string. Next we compute the md5 and check if there was anything or not. If there was, we want to check the database for an existing paste that is the exact url as this one. If there is we don’t bother creating anything new, just give them the link from the earlier created one. If we don’t find anything, we create a new Paste object (an entry in the table) and save it to the database. Afterwards we setup the variables and the template to render for the page to be displayed and return it.

Now for the retrieval of a paste, it’s even simpler:


    def fetch_paste(request):
        url = request.META.get('PATH_INFO', '')[1:]
        content = ""

        try:
            p = Paste.objects.get(url=url)
        except:
            t = loader.get_template('pastebin/templates/index.html')
            c = Context({
                'error': "Paste '%s' does not exist." % url
            })
            return http.HttpResponse(t.render(c))

        return http.HttpResponse(p.content)

In fetch_paste, we grab the url from the request. Then we attempt to find a paste that matches that url. If we do find one, we simply render the content of the paste, if not we render the homepage and display the error.

Nothing much to it. Fairly straight forward. Reading through the Django documentation and tutorial will make this clearer where I kind of skimmed over (which was probably in most areas). More of getting the logic and flow down than the syntax was my goal. Hopefully this helps!

   [1]: http://github.com/excid3/simpyl_pastebin
