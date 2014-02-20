Nowcast this
============

Nowcasting is a technique which has recently gained popularity in economics.
Essentially low frequency economic variables are foretasted by a series of
higher frequency variables in state space. The canonical example is that of
predicting GDP figures (low frequency of data release) from higher frequency
variables such as jobless figures, industrial orders and trade balance.

Such a model can be written as a system of two equations:

* measurement equations linking observed series to latent variable (or state
  process)

    .. math::

        Y_t^{K_Y} = \mu + \zeta(\Theta)X_t + G_t

    
* transistion equations describing the state process dynamics

    .. math::

        X_t = \phi(\Theta)X_{t-1} + H_t

where in the above equations :math:`Y_t^{K_Y}` is the vector of observed
variables and :math:`X_t` is the unobserved state variables, the dynamics of
which are explained by the transition equation. 

:math:`G_t` and :math:`H_t` represent covariance matrices of the disturbances
and :math:`\phi(\Theta)` and :math:`\zeta(\Theta)` represent matrices of the
coefficients. The covariance matrices are determined from an iterative
Expectation-Maiximisation algorithm.

As the model is in state-space we can now gain projections for both the
observed and the predicted variables using the Kalman filter, as well as
allowing us to have missing variables in our series.

It's an interesting approach as the forecast for the low-frequency variable
gets progressively more accurate as more data is released as we move closer to
the announcement date. This means that there is a `news` component or
"unexpected" component which we obtain from the model as the long-term (or
indeed short-term) variables have their forecast updated, which is could be a
useful signal.


A `paper <http://www.ecb.europa.eu/pub/pdf/scpwps/ecbwp1564.pdf>`_ by Marta Bańbura, Domenico Giannone, Michele Modugno and Lucrezia
Reichlin reviewing the approaches can be found on the ECB website.

.. author:: default
.. categories:: none
.. tags:: research
.. comments::
