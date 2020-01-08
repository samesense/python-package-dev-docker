FROM buildpack-deps:buster-scm

RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		bzip2 \
		unzip \
		xz-utils
  
  RUN apt-get update -qqy \
  && apt-get -qqy --no-install-recommends install sudo build-essential openssl libssl-dev ca-certificates \
  && apt-get -qqy --no-install-recommends install git subversion jq curl wget
  
  RUN apt-get update -qqy \
  && apt-get -qqy install build-essential python python-pip python-virtualenv python3 python3-pip python3-virtualenv jython pypy openssl curl \
  && pip3 install -U setuptools wheel > /dev/null \
  && pip3 install -U black isort pylama tox virtualenv pylint pipenv bumpversion twine > /dev/null \
  && apt-get remove --purge -y \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /tmp/*
