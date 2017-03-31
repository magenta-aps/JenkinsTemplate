======================
Django Example Project
======================
The Django Example Project is a Django_-based starter project, aimed at being a
project basis for future Django Projects at Magenta ApS.

.. _Django: https://www.djangoproject.com/

Quick Start
===========
Getting started is easy (for more details, see: :ref:`installation`):

**Note** These instructions are to be run inside the :code:`src` subfolder.

    #. Install the required software packages.

        It is required to have :code:`pip`, :code:`python2.7`, :code:`python-dev` installed.

    #. (Optional) Setup a :code:`virtualenv`.

    #. Install the project dependencies:

        .. code:: bash

            (venv) $ pip install -r requirements.txt

    #. Setup the project:

        .. code:: bash

            (venv) $ python manage.py migrate
     
    #. Ensure everything works:

        .. code:: bash

            (venv) $ python runtests.py

Using the project
=================
For development the project can be started using (inside the :code:`src` folder):

.. code:: bash

    (venv) $ python manage.py runserver

During so will start a development server running at http://localhost:8000/.

Getting help
============
If the :ref:`FAQ <faq>` doesn't answer your question, you can try the
developers `IRC channel`_ located at: :code:`#magenta-aps @ freenode.net`

.. _IRC channel: http://webchat.freenode.net/?channels=magenta-aps&nick=magentavisitor
