FROM lsiobase/rdesktop-web:bionic

# set version label
ARG BUILD_DATE
ARG VERSION
ARG WIRESHARK_VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="hackerman"

RUN \
 echo "**** install packages ****" && \
 apt-get update && \
 apt-get install -y \
	digikam \
        kipi-plugins && \
 echo "**** cleanup ****" && \
 apt-get clean && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

# add local files
COPY /root /

# ports and volumes
EXPOSE 3000
