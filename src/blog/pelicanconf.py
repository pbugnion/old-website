#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

AUTHOR = u'Pascal Bugnion'
SITENAME = u'Data diversions'
SITEURL = 'http://localhost:8000'

ARTICLE_SAVE_AS = "{slug}.html"
ARTICLE_URL = "blog/{slug}.html"

PATH = 'content'

ARTICLE_EXCLUDES = [ '.ipynb_checkpoints', 'summaries' ]

TIMEZONE = 'Europe/Paris'

DEFAULT_LANG = u'en'

MARKUP = ('md', 'ipynb')
PLUGIN_PATHS = ['./plugins']
PLUGINS = ['ipynb']

LOAD_CONTENT_CACHE = False

THEME = "themes/simple"

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None

# Blogroll
LINKS = (('Pelican', 'http://getpelican.com/'),
         ('Python.org', 'http://python.org/'),
         ('Jinja2', 'http://jinja.pocoo.org/'),
         ('You can modify those links in your config file', '#'),)

# Social widget
SOCIAL = (('You can add links in your config file', '#'),
          ('Another social link', '#'),)

DEFAULT_PAGINATION = False

# Uncomment following line if you want document-relative URLs when developing
#RELATIVE_URLS = True
