Updating my web design stack
============================

For data intensive and service related projects I always prefer to use the
simplicity of `Tornado <http://www.tornadoweb.org/en/stable/>`_. Recently I had
occasion to consider a more classic CMS type of applciation. I looked at Django
a number of years ago and was largely unimpressed, probably because the need at
the time was not for a CMS platform and the design of the admin interface
seemed a bit late 90's. 

My opinion has changed however with the `Wagtail
<https://github.com/torchbox/wagtail>`_ project from Torchbox. Very nice design
and some of the key Django apps, like South, bundled in.

Also, I have been impressed with the `Bower <http://bower.io/>`_ project -
which provides a package manager for front end components on `Node
<http://nodejs.org/>`_.

Anyway, to get these fancy Javascript tools working in a Python virtualenv do
the following from within a virtualenv:

.. code-block:: bash

    pip install nodeenv
    nodeenv --python-virtualenv  # activate nodeenv in the current virtualenv
    npm install -g bower

Great!


.. author:: default
.. categories:: none
.. tags:: tools
.. comments::
