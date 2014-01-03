
Setting up Matlab
=================

In cases where Administrator privileges are not held, the following config. is
flexible.

Define MATLAB's ``userpath`` to be a user writeable directory. This is the initial
directory MATLAB will parse.

Within the ``userpath`` create ``startup.m``::

    if ~isdeployed
        path(my_path)
        set_vars

Where ``my_path`` is a matlab file which sets the path like::

    function p = my_path
        p = ['C:\temp;', 'C:\important_dir;']
        cd('C:\temp')

So we set the path and cd to a relevant directory. Also in the userpath folder,
one can keep many files like ``my_path.m``, which define different contexts to
work in.

.. author:: default
.. categories:: none
.. tags:: none
.. comments::
