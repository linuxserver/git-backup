FROM lsiobase/alpine:3.7

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="sparklyballs"

RUN \
 echo "install packages" && \
 apk add --no-cache \
	curl \
	findutils \
	git \
	python2

# add local files
COPY root/ /

# ports and volumes
VOLUME /backup /config
