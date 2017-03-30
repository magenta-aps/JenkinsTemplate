================
Jenkins Template
================
Example configuration for setting up Jenkins at Magenta ApS.

Quick Start
===========
Getting started is easy:

#. Ask our lovely sysadmin for a Jenkins Server with the default configuration.

#. Add :code:`magenta-jenkins` as admin on the repository on GitHub.

#. Add a webhook with:

   Payload URL:
    
   * http://atlas.magenta.dk:PORT/github-webhook/

   Content type:

   * :code:`application/json`

   No secret, just the :code:`push` event.

   And as active.
