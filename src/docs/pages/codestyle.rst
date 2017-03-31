==========
Code Style
==========
To ensure consistency across the codebase, a common code style will be utilized.

For this project the PEP8_ style will be utilized. A tool is in place to check
whether the codebase is currently fulfilling the required codestyle. See
:ref:`Check PEP8 compliance`.

Additionally code will be statically analyzed using the pylint_ tool, this tool
checks for many pitfalls and ensures that the code fulfills several invariants
with regards to documentation, formatting and functionality. See :ref:`Linting
the code`.

.. _PEP8: https://www.python.org/dev/peps/pep-0008/
.. _pylint: https://www.pylint.org/

Check PEP8 compliance
---------------------
This can be done, by running: :code:`flake8 app/`

.. code:: console

    $ flake8 app/

    app/views.py:1:1: D100 Missing docstring in public module
    app/views.py:1:1: F401 'django.shortcuts.render' imported but unused
    app/views.py:4:1: E302 expected 2 blank lines, found 1
    app/views.py:4:1: D103 Missing docstring in public function

If the program does:

* not produce any output; the code is compliant.
* does produce output; it will be as in the above example, descriptions of the
  errors, and instructions on how to make the code compliant.

Linting the code
----------------
This can be done, by running: :code:`pylint -rn app/`.

.. code:: console

    $ pylint -rn app/

    ************* Module app.views
    C:  1, 0: Missing module docstring (missing-docstring)
    C:  4, 0: Missing function docstring (missing-docstring)
    W:  4,10: Unused argument 'request' (unused-argument)
    W:  1, 0: Unused render imported from django.shortcuts (unused-import)

If the program does:

* not produce any output; the code does not contain any linting issues
* does produce output; it will be as in the above example, descriptions of the
  errors, and instructions on how to make the code compliant.
