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
RUN apt-get install -y python python-dev python-pip git

# get Ganeti Web Manager from branch 'develop'
RUN git clone https://github.com/osuosl/ganeti_webmgr.git /ganeti_webmgr_src \
    && cd /ganeti_webmgr_src \
    && git checkout develop

# install web server (globally)
RUN pip install gunicorn

# install GWM into that venv
RUN pip install -e /ganeti_webmgr_src

# run gunicorn (WSGI server) with GWM
ENTRYPOINT ["gunicorn", "--bind", "127.0.0.1:8000", \
            "ganeti_webmgr.ganeti_web.wsgi:application"]

EXPOSE 8000
