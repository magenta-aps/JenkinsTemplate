=========================
Testing and Code Coverage
=========================
This project utilizes Unit-Testing.

Following the installation as mentioned in the :ref:`Quick Start`, or in the
:ref:`Installation` sections of the documentation, will setup a proper
environment for running the tests.

Below is an introduction into running tests, and checking code coverage.

Running Unit-tests
------------------
This can be done, by running: :code:`./runtests.sh`.

.. code:: console

    $ ./runtests.sh

    Creating test database for alias 'default'...
    .
    ----------------------------------------------------------------------
    Ran 1 test in 0.010s

    OK
    Destroying test database for alias 'default'...

If the program exists with the line:

* :code:`OK`, all tests passed.
* :code:`FAILED`, some tests failed, and this should be corrected.

Checking code coverage
^^^^^^^^^^^^^^^^^^^^^^
Running the unit-tests as described above, has the side-effect og generating
code-coverage information in the file :code:`.coverage` inside :code:`app`.

This file is not suited for human consumption, but should rather be read using
the `coverage.py`_ program. This can be done by running :code:`coverage report`

.. code:: console

    $ coverage report

    Name            Stmts   Miss Branch BrPart  Cover
    -------------------------------------------------
    app/admin.py        1      0      0      0   100%
    app/apps.py         4      0      0      0   100%
    app/models.py       2      0      0      0   100%
    app/urls.py         3      0      0      0   100%
    app/views.py        4      0      0      0   100%
    -------------------------------------------------
    TOTAL              14      0      0      0   100%

An alternative is to output the coverage report as :code:`html` and view it
using a web-browser, this can be done by running :code:`coverage html` and
opening the generated :code:`htmlcov/index.html` file.

If the coverage is less than 100% in TOTAL, this should be corrected by adding
additional tests.

For :code:`python` files, this can be done by adding tests that directly
exercise the code, while for Django templates :code:`.html`, this can be done by
adding test cases for the Django views resposible for rendering those templates.

.. _coverage.py: https://coverage.readthedocs.io/en/coverage-4.3.4/
