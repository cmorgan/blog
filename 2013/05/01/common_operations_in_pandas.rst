
Common operations in Pandas
===========================

This is another "do not forget" post.

If you munge data in Python then you really should be using `Pandas
<http://pandas.pydata.org/>`_. These are some notes about common operations.

Hierachical index
-----------------

Given a set of data like this (refered to as Table A):

     +---------------------+---------+---------+---------+----------+
     |                     | Bid     | Mid     | Offer   | Variable |
     +=====================+=========+=========+=========+==========+
     | 1994-01-03 16:00:00 | 0.9980  | 0.9981  | 0.9981  | ARS      |
     +---------------------+---------+---------+---------+----------+
     | 1994-01-03 16:00:00 | 12.2190 | 12.2215 | 12.2240 | ATS      |
     +---------------------+---------+---------+---------+----------+
     | 1994-01-03 16:00:00 | 0.6835  | 0.6838  | 0.6840  | AUD      |
     +---------------------+---------+---------+---------+----------+
     | 1994-01-03 16:00:00 | 39.0000 | 39.0000 | 39.0000 | BDT      |
     +---------------------+---------+---------+---------+----------+
     | 1994-01-03 16:00:00 | 36.2060 | 36.2425 | 36.2790 | BEF      |
     +---------------------+---------+---------+---------+----------+

It often makes more sense to represent it as a hierachical index (referred to as Table B), e.g.

    +---------------------+----------+---------+---------+---------+
    |                     |          | Bid     | Mid     | Offer   |
    +=====================+==========+=========+=========+=========+
    | index               | Variable |         |         |         |
    +---------------------+----------+---------+---------+---------+
    | 1994-01-03 16:00:00 | ARS      | 0.9980  | 0.9981  | 0.9981  |
    +---------------------+----------+---------+---------+---------+
    |                     | ATS      | 12.2190 | 12.2215 | 12.2240 |
    +---------------------+----------+---------+---------+---------+
    |                     | AUD      | 0.6835  | 0.6838  | 0.6840  |
    +---------------------+----------+---------+---------+---------+
    |                     | BDT      | 39.0000 | 39.0000 | 39.0000 |
    +---------------------+----------+---------+---------+---------+
    |                     | BEF      | 36.2060 | 36.2425 | 36.2790 |
    +---------------------+----------+---------+---------+---------+

This can be done for a pandas.DataFrame ``df`` like so

.. code-block:: python

    df.reset_index().set_index(['index', 'Variable'])


Subset of columns and a pivot
-----------------------------

Consider again Table A above loaded as ``df``, if we wish to filter out a
subset of values in the ``Variable`` column, and consider the ``Mid`` values
only for then we can do the following to have a continuous time series:

.. code-block:: python

    g10_set = [
    'USD', 'EUR', 'JPY', 'CHF', 'GBP', 'AUD', 'CAD', 'SEK',
    'NOK', 'NZD' 
    ]

    df = df[df['Variable'].isin(g10_set)]
    df = df.reset_index().pivot(
        index='index', columns='Variable', values='Mid'
    )


Which results in Table C:

    +---------------------+--------+--------+--------+-----+--------+---------+--------+------+
    | Variable            | AUD    | CAD    | CHF    | EUR | GBP    | JPY     | NOK    | .... |
    +=====================+========+========+========+=====+========+=========+========+======+
    | index               |        |        |        |     |        |         |        |      |
    +---------------------+--------+--------+--------+-----+--------+---------+--------+------+
    | 1994-01-03 16:00:00 | 0.6838 | 1.3143 | 1.4827 | NaN | 1.4805 | 112.395 | 7.5251 |      |
    +---------------------+--------+--------+--------+-----+--------+---------+--------+------+
    | 1994-01-04 16:00:00 | 0.6848 | 1.3164 | 1.4861 | NaN | 1.4819 | 113.155 | 7.5259 |      |
    +---------------------+--------+--------+--------+-----+--------+---------+--------+------+
    | 1994-01-05 16:00:00 | 0.6873 | 1.3153 | 1.4800 | NaN | 1.4864 | 112.760 | 7.5020 |      |
    +---------------------+--------+--------+--------+-----+--------+---------+--------+------+
    | 1994-01-06 16:00:00 | 0.6843 | 1.3220 | 1.4745 | NaN | 1.4880 | 112.555 | 7.4903 |      |
    +---------------------+--------+--------+--------+-----+--------+---------+--------+------+
    | 1994-01-07 16:00:00 | 0.6868 | 1.3225 | 1.4705 | NaN | 1.4905 | 111.825 | 7.4865 |      |
    +---------------------+--------+--------+--------+-----+--------+---------+--------+------+


Working with the index
----------------------

To extract indexed data points which are common to df1 from df2, you can do the
following:

.. code-block:: python

    df2 = df2.ix[df1.index]

To extract ranges of index from df2, the DataFrame may be sliced:

.. code-block:: python

    # extract ranges of index
    df2.ix[df1.index[0]:df1.index[-1]]

    # and similarly specific values may also be accesed, pandas will coerce
    # these to pd.Timestamp
    df2.ix['2013-12-31 16:00:00']


Other bits and bobs
-------------------

* Find row where value of column is max: ``df['AUD'].argmax()``
* Find indexes of null values ``pd.isnull(df).any(1).nonzero()`` which is
  utilising the ``nonzero`` numpy object, i.e. return indicies of elements
  which are nonzero.

.. author:: default
.. categories:: none
.. tags:: python, tools
.. comments::
