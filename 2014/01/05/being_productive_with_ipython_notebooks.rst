Being even more productive with IPython notebooks
=================================================

IPython notebooks are an awesome tool for exploring data. Currently there are a
few issues with the software which the community are working through.

Slides
------

Particularly useful is the ability to be able to create slides from your
notebooks using reveal.js:

.. code-block:: bash

   python3 nbconvert --to slides BeigeBook.ipynb --post serve 

But we need to follow these steps in order for the formatting to work
correctly:

#. Add this custom.css file: https://gist.github.com/damianavila/6211198
#. Run this little snippet: https://gist.github.com/damianavila/6211211
#. Add ?print.pdf to the end of the url
#. Print to pdf, use Landscape orientation

Git
---

The JSON format of IPython notebooks is great, however there is no need to save Base64 encoded binary data in Git. We can strip out the binary blobs with Git filters.  Add the following somewhere on your path: https://github.com/cfriedline/ipynb_template/blob/master/nbstripout, then add the following in ``.git/config``:

.. code-block:: bash

    [filter "stripoutput"]
        clean = "/path/to/nbstripout"

And a ``.gitattributes`` file in your project root with the following contents:

.. code-block:: bash

    *.ipynb filter=stripoutput

You will not notice any changes to your local ``.ipynb`` file when you commit (as the content is being filtered, not replaced as a pre-commit hook would do). Once committed, delete the file and checkout again and you will see a ``.ipynb`` file sans output. Also the numbering of cells will start continuously from 1 - great!


.. author:: default
.. categories:: none
.. tags:: tools, python
.. comments::
