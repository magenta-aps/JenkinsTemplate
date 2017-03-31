============
Installation
============
Installing the development environment is an easy process, that goes through multiple steps:

* Setting up the OS environment
* Setting up a developer environment
* Installing project dependencies
* Setting up the project

Each of these is treated in sequence below.

Setting up the OS environment
-----------------------------

    Several software packages are required to bootstrap the setup project, and
    should be acquired using the operating system package manager:

        * git
        * pip
        * python2.7

    Under debian_ this can be done using:

    .. code:: bash

        $ sudo apt-get update
        $ sudo apt-get install -y git python2.7 python-pip python-dev
        $ pip install --upgrade pip

    .. _debian: https://www.debian.org/

Setting up a developer environment
----------------------------------

    While it is not strictly required to setup a virtual environment for
    development, it is strongly recommended.

    The below describes how to setup a virtual environment using virtualenv_

    .. _virtualenv: https://virtualenv.pypa.io/en/stable/

    .. code:: bash

        $ pip install virtualenv
        $ virtualenv --python=python2.7 ~/venv

    The environment can be activated by running:

    .. code:: bash
        
        $ source ~/venv/bin/activate
        (venv) $ echo "The prefix (venv) states that the environment is active"

    And deactivated by running:

    .. code:: bash
        
        (venv) $ deactivate
        $ echo "The prefix (venv) is now gone"

Installing project dependencies
-------------------------------

    To install the required dependencies, run:

    .. code:: bash

        (venv) $ pip install -r requirements.txt

Setting up the project
----------------------

    Now the project is well-configured, and we can generate our database using:

    .. code:: bash

        (venv) $ python manage.py migrate

        Operations to perform:
          Apply all migrations: admin, adminapp, auth, contenttypes, sessions, webapp
        Running migrations:
          Applying contenttypes.0001_initial... OK
        ...

    At this point the setup is done and ready to go:

    .. code:: bash

        (venv) $ ./runtests.sh
