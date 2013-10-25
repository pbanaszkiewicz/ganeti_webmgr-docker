# Ganeti Web Manager
# with SQLite database
#
# Version 0.1

# use Ubuntu as base image
FROM ubuntu
MAINTAINER Piotr Banaszkiewicz, piotr@banaszkiewicz.org

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

# install required dependencies
RUN apt-get install -y python python-dev python-virtualenv git

# get Ganeti Web Manager from branch 'develop'
RUN git clone https://github.com/osuosl/ganeti_webmgr.git
RUN cd ganeti_webmgr
RUN git checkout develop
RUN cd -

# set up virtual environment
RUN virtualenv --setuptools --no-site-packages gwm

# install web server into that venv
RUN ./gwm/bin/pip install gunicorn

# install GWM into that venv
RUN ./gwm/bin/pip install -e ../ganeti_webmgr
