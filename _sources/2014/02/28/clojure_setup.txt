Clojure setup
=============

I'm having lots of fun learning Clojure. There are a couple of decent ways to
be productive in Vim with Clojure, described below:

Vim-Fireplace
-------------

`Vim-fireplace <https://github.com/tpope/vim-fireplace>`_ connects to a Clojure
REPL instance from within Vim.

Some key commands:

+---------+------------------------------------------------+
| Command | Function                                       |
+=========+================================================+
| `cpp`   | Execute the current form.                      |
+---------+------------------------------------------------+
| `cpr`   | Reload the current file.                       |
+---------+------------------------------------------------+
| `K`     | Lookup help for command that the cursor is     |
|         | under.                                         |
+---------+------------------------------------------------+
| `[d`    | Lookup source that the command is under.       |
+---------+------------------------------------------------+

It works well, but i need to figure out a way to ensure that the REPL buffer is
always open as the popping open of the buffer grows old quickly.


Vim-slime
---------

A solution which uses the excellent Tmux is `vim-slime
<https://github.com/jpalardy/vim-slime>`_, a nice setup is described in this
`blog <http://michaelalynmiller.com/blog/2013/02/27/vim-tmux-clojure/>`_. It
works with any REPL. In brief you open a Clojure REPL in a Tmux window and tell
Vim to send highlighted lines. It's good as the REPL window remains open
showing the command execution history.

Some key commands:

+--------------------------------+-----------------------------------------+
| Command                        | Function                                |
+================================+=========================================+
| `C-c, C-c`                     | Send line to Tmux window with REPL.     |
+--------------------------------+-----------------------------------------+
| `<highlight lines> C-c, C-c`   | Send line to Tmux window with REPL.     |
+--------------------------------+-----------------------------------------+


Conclusion
----------

A combination of both of the above works really well. I use Vim-Fireplace in
order to get contextual help and Vim-slime to execute code. Once i figure out
how to have a consistent buffer open in vim-fireplace then i guess i'll ditch
vim-slime.


.. author:: default
.. categories:: none
.. tags:: toosl, clojure
.. comments::
