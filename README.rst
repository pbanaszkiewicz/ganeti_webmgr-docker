ganeti_webmgr-docker
====================

Docker installation for Ganeti Web Manager.

Requirements
------------

* Docker


Installation
------------

Simply clone this repo::

  git clone https://github.com/pbanaszkiewicz/ganeti_webmgr-docker.git


Configuration
-------------

Not required.


Running
-------

First you have to build a container with Docker::

  cd ganeti_webmgr-docker
  sudo docker build -t ganeti_webmgr .

(It will take a while to download all the necessary dependencies and then
compile some packages).

Then simply run the container::

  sudo docker run -p 8000:8000 ganeti_webmgr

**Congrats!** Ganeti Web Manager should now be reachable from
``localhost:8000``.
