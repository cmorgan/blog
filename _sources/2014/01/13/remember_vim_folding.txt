
Remember Vim folding
=====================

+-----+----------------------------------------+
| Key | Operation                              |
+=====+========================================+
| zO  | Open all folds recursivley             |
+-----+----------------------------------------+
| zo  | Open one fold                          |
+-----+----------------------------------------+
| zc  | Close one fold                         |
+-----+----------------------------------------+
| zC  | Close all folds recursivley            |
+-----+----------------------------------------+
| za  | Toggle fold                            |
+-----+----------------------------------------+
| zA  | Toggle fold recursivley                |
+-----+----------------------------------------+
| zR  | Open all folds                         |
+-----+----------------------------------------+
| zM  | Close all folds                        |
+-----+----------------------------------------+

Then i set the following in .vimrc::

    " folding
    " toggle open fold
    nnoremap f zA
    " open all
    nnoremap F zR
    " clos all
    nnoremap <C-f> zM

.. author:: default
.. categories:: none
.. tags:: none
.. comments::
