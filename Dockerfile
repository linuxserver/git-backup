FROM lsiobase/alpine
MAINTAINER sparklyballs

# install packages
RUN \
 apk add --no-cache \
	curl \
	findutils \
	git \
	python

# add local files
COPY root/ /

# ports and volumes
VOLUME /backup /config
