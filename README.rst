================
Jenkins Template
================
Example configuration for setting up Jenkins at Magenta ApS.

Quick Start
===========
Getting started is easy:

#. Ask our lovely sysadmin for a Jenkins Server with the default configuration.

    He will need:

    * Identifiers for the repositories (e.g. JenkinsTemplate)
    * Homepages for the repositories (e.g. https://github.com/USER/PROJECT)
    * git urls for the repositories (e.g. git@github.com:USER/PROJECT.git)

    Preferably formatted as:

    .. code:: console

        jenkins_jobs: 
          - job:
                 name: "JenkinsTemplate"
                 project_url: "https://github.com/magenta-aps/JenkinsTemplate"
                 project_git: "git@github.com:magenta-aps/JenkinsTemplate.git"
          - job:
                 name: "AnotherRepository"
                 project_url: "https://github.com/magenta-aps/Another"
                 project_git: "git@github.com:magenta-aps/Another.git"

    * Note: :code:`name` should be a valid UNIX filename *

#. Add :code:`magenta-jenkins` as admin on the repositories on GitHub.

    Poke Emil to accept the invite (he has the :code:`magenta-jenkins` user).

#. Copy the jenkins configuration to the project.

    Namely:

    .. code:: bash

        jenkins.sh
        jenkins/*

#. Create files containing the Jenkins server url and port.

    .. code:: bash

        echo "jenkins_server_url.magenta.dk" > jenkins/JENKINS_SERVER_URL
        echo "8080" > jenkins/JENKINS_SERVER_PORT

#. Setup build environment and testing inside :code:`jenkins/inside_docker.sh`.

    Jenkins picks up various build results, from within the :code:`reports`
    subfolder (expected to be generated during build).

    .. code:: console

        jenkins
        jenkins.sh
        README.rst
        reports <-- THIS ONE
        src

    The files which are expected inside are:

    .. code:: console

        docs/           <-- HTML documentation to be published (index.html)
        test/           <-- JUnit XML test report (TEST-*-2017*.xml)
        coverage.xml    <-- Cobertura XML code coverage report
        pep8.log        <-- PEP8/Flake8 code checking log
        pylint.log      <-- Pylint parseable code checking log

    The last two checks are python specific, and can be disabled inside Jenkins
    job configuration.

#. (Optional) Notify Jenkins on :code:`git push` using post-push hook

    As :code:`git` does not support post-push hooks by design, this isn't
    directly implemented, but rather two alternatives are provided.

    * Using a git command alias.

        By running :code:`jenkins/install_xpush.sh` a command will be added to
        :code:`.git/config` which can be utilized by running :code:`git xpush`.

        The new command, will do an ordinary :code:`git push`, followed by an
        invokation of the :code:`jenkins/trigger_build.sh` script.

    * Using a git shell alias.

        The alternative to a git command alias, is a git shell alias, which
        calls through to git, but triggers Jenkins after :code:`git push`.

        Such a script is provided as :code:`jenkins/git_replace.sh`, and can be
        registered as an alias in most UNIX shells as;

        .. code::

            alias git=$PWD/jenkins/git_replace.sh

    * Using multiple origin push locations

        *NOTE: Not currently supported on the server side*

        By configuring multiple :code:`origin` urls, one can have a local server
        trigger the git post-recieve hook, while still pushing the code to
        GitHub.
       
        Such a post-recieve hook, can then be setup to trigger the CI build.

        For the work so far, see: :code:`jenkins/install_ci_remote.sh`.

        After having setup the multiple push origins, running the ordinary
        :code:`git push` will push to both origins, and thus trigger the CI
        build automatically.

Usage
=====
After making some code changes, we want an automatic build.
If the build trigger is added as a git push-hook, all you need to do is push
to the repository. If a push-hook is not in place; triggering builds can be done
manually by running the trigger_build script:

.. code:: bash

    ./jenkins/trigger_build.sh

