===============
Committing code
===============
Before committing code, several checks should be made, namely;

* :ref:`That all tests pass <Testing and Code Coverage>`
* :ref:`That code coverage is 100% <Checking code coverage>`
* :ref:`That the codestyle is adherred to <Check PEP8 compliance>`
* :ref:`That there are no linting errors <Linting the code>`

For more information about these steps, please check their corresponding
sections.

Jenkins
-------
This project utilizes Jenkins_ for continuous integration.

The Jenkins server can be reached at the URL given by the sys admin, with the
corresponding login credentials.

Jenkins is setup to automatically build every single push, to every single
branch on, using the git push-hook. And will mark each commit with a success
/ failure mark, depending on the outcome of the build.

The build page can be reached by clicking the icon next to the commit on GitHub,
and will present a page containing the analysis of the build:

* Changes since last build
* Revision and branch
* Cobertura Code Coverage Report
* Test results
* PEP8 compliance and linting results.

Along with a colored ball, denoting the state of the build, one of;
:code:`Failed`, :code:`Unstable` and :code:`Success`. Only successful builds are
accepted and should be merged to :code:`development`.

Jenkins currently:

* Setups a clean :code:`debian:jessie` machine.
* Configures a developer environment using the :code:`jenkins/inside_docker.sh`
* Runs all :ref:`Unit Tests <Running Unit-tests>`
* Checks :ref:`code coverage <Checking code coverage>`
* Checks :ref:`codestyle <Check PEP8 compliance>`
* :ref:`Lints the code<Linting the code>`
* Generates this :ref:`documentation <Generating documentation>`.

All of this functionality is implemented using the Jenkins entry point, namely
the; :code:`jenkins.sh` script.

.. _Jenkins: https://jenkins.io/
.. _`magenta-aps/boligadmin`: https://github.com/magenta-aps/boligadmin/
