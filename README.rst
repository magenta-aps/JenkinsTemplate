================
Jenkins Template
================
Example configuration for setting up Jenkins at Magenta ApS.

Quick Start
===========
Getting started is easy:

#. Ask our lovely sysadmin for a Jenkins Server with the default configuration.

#. Add :code:`magenta-jenkins` as admin on the repository on GitHub.

    Poke Emil to accept the invite (he has the :code:`magenta-jenkins` user).

#. (Optional) Add build trigger as git push-hook

Usage
=====
After making some code changes, we want an automatic build.
If the build trigger is added as a git push-hook, all you need to do is push
to the repository. If a push-hook is not in place; triggering builds can be done
manually by running the trigger_build script:

.. code:: bash

    ./jenkins/trigger_build.sh

