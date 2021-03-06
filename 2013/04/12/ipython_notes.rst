IPython notes
=============

This is a post to jog my memory when needed.

IPython saves all it's hisotry in a SQLite database. This is super useful for
recovering commnads from an interactive programming session. 

Imagine you forgot to save some dataset manipulation (loading tabdeliminated
csv into a DataFrame), you can easily recover that analysis:

Find the command which used the Pandas read_table

.. code-block:: python

    In [1]: %history -g read_table
    173/5: df = pd.io.parsers.read_table(fname, header=6)
    173/9: pd.io.parsers.read_table?
    173/10: df = pd.io.parsers.read_table(fname, header=6, index_col=0)
    173/12: df = pd.io.parsers.read_table(fname, header=6, index_col=0, parse_dates=True)

Export a chunk of that history to a file for editing:

.. code-block:: python

    In [2]: %history 173/12-2000 -f hist.py

Then after editing the file ``hist.py`` run this inside your currency IPython
session with ``run -i hist.py`` (where the ``-i`` indicated running the script
inside the current sessions namespace).

Sweeet!

.. author:: default
.. categories:: none
.. tags:: remember, tools, python
.. comments::
