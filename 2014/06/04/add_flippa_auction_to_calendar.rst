Add Flippa auction to calendar
==============================

This is a nasty hack to add a link to Flippa which will put you on the road to
adding an event to your Google Calendar at the auction end time. Add the
following javascript as a Bookmarklet:

.. code-block:: javascript

    javascript:void($( "#auctionstatus" ).append( "<a href='" + "http://google.co.uk/search?q=" + encodeURI("google calendar add " + $("#auctionstatus").attr("title").substr(41, 19)) + "'>Add to calendar</a>"));



.. author:: default
.. categories:: none
.. tags:: none
.. comments::
