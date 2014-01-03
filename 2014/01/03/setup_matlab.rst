
Setting up MATLAB contexts
==========================


If you are forced to use MATLAB (here's a whole blog devoted to the topic of
why not to use it http://abandonmatlab.wordpress.com/) the following advice
maybe useful for easily managing your path and hence creating contexts of work.

In cases where Administrator privileges are not held, the following config. is
flexible.

Define MATLAB's ``userpath`` to be a user writeable directory. This is the initial
directory MATLAB will parse.

Within the ``userpath`` create ``startup.m``: 

.. code-block:: matlab

    if ~isdeployed
        path(my_path)
        set_vars

Where ``my_path`` is a matlab file which sets the path like:


.. code-block:: python

   function p = my_path
        p = ['/home/chris/matlab;', '/home/chris/important;'];
        cd('/home/chris/matlab');
   end

So we set the path and cd to a relevant directory. Also in the userpath folder,
one can keep many files like ``my_path.m``, which define different contexts to
work in, making changing contexts as easy as:

.. code-block:: matlab

   path(my_other_path)

Whithin each context ``path`` file if you also call the ``set_vars`` script,
this allows ``set_vars`` to contain useful variables e.g. paths to output
directories and the like.

.. author:: default
.. categories:: none
.. tags:: matlab
.. comments::
