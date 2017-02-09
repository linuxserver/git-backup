FROM lsiobase/alpine:3.5
MAINTAINER sparklyballs

# install packages
RUN \
 apk add --no-cache \
	curl \
	findutils \
	git \
	python2

# add local files
COPY root/ /

# ports and volumes
VOLUME /backup /config
