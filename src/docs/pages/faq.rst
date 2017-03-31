.. _faq:

==========================
Frequently Asked Questions
==========================
**Q: I'm getting the error "attempt to write a readonly database". Why?**

This error occurs when Django is unable to access the :code:`db.sqlite3`
database inside the :code:`src` folder. This is usually a case of bad
permission and/or user/group configuration.

A proper configuration should have both the read and write flag set
(:code:`rw`), for the user running the code:

.. code:: console

    $ ls -lh db.sqlite3

    -rw-r--r-- 1 username username 156K Mar 23 12:52 db.sqlite3

When running in a WSGI_ setup, like on the Atlas server, it is necessary to set
the permission as :code:`-rw-rw-r--` or :code:`664`, and to change the group
owner of the files to :code:`www-data`, such that the WSGI server user can write
the database file.

.. code:: console

    $ ls

    jenkins/  jenkins.sh  README.rst  src/

    $ sudo chown :www-data -R .
    $ sudo chmod 664 src/db.sqlite3

.. _WSGI: https://en.wikipedia.org/wiki/Web_Server_Gateway_Interface
