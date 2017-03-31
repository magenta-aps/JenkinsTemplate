=======================
Django Jenkins Template
=======================
Example configuration for django projects running Jenkins at Magenta ApS.

For the non-django setup, see `here`__.

*NOTE: Project is broken, app cannot be called app*

.. _MasterBranch: https://github.com/magenta-aps/JenkinsTemplate/
__ MasterBranch

Quick Start
===========
Getting started is easy:

#. Ask our lovely sysadmin for a Jenkins Server with the default configuration.

#. Add :code:`magenta-jenkins` as admin on the repository on GitHub.

    Poke Emil to accept the invite (he has the :code:`magenta-jenkins` user).

#. Create a file containing the Jenkins server url.

    .. code:: bash

        echo "http://SERVER_URL:PORT" > jenkins/JENKINS_SERVER_URL

#. (Optional) Add build trigger as git push-hook

Usage
=====
After making some code changes, we want an automatic build.
If the build trigger is added as a git push-hook, all you need to do is push
to the repository. If a push-hook is not in place; triggering builds can be done
manually by running the trigger_build script:

.. code:: bash

    ./jenkins/trigger_build.sh

