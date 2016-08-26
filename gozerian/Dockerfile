#Duped and modified from https://github.com/openresty/docker-openresty

# Dockerfile - alpine
# https://github.com/openresty/docker-openresty

FROM thirtyx/openresty:1.9.15.1

MAINTAINER Todd Nine <todd@apigee.com>

# Docker Build Arguments
ARG GATEKEEPER_VERSION="master"
ARG GATEKEEPER_URL="https://github.com/30x/gatekeeper.git"
ARG KEYMASTER_VERSION="master"
ARG KEYMASTER_URL="https://github.com/30x/keymaster.git"
ARG APID_VERSION="master"
ARG APID_URL="https://github.com/apigee-internal/apid.git"




#Go installation copied from here https://github.com/docker-library/golang/blob/ba5f6a10dcc46edeb66377261f873e3b61af36f5/1.7/alpine/Dockerfile


RUN apk add --no-cache ca-certificates

#Builds go 1.7 from source and then leaves it on the path, removing any other deps
ENV GOLANG_VERSION="1.7"
ENV GOLANG_SRC_URL="https://golang.org/dl/go$GOLANG_VERSION.src.tar.gz"
ENV GOLANG_SRC_SHA256="72680c16ba0891fcf2ccf46d0f809e4ecf47bbf889f5d884ccb54c5e9a17e1c0"

ARG GOBUILDDIR="/tmp/localbuild"

RUN set -ex \
	&& apk add --no-cache --virtual .build-deps \
		bash \
		gcc \
		musl-dev \
		openssl \
		go \
	\
	&& export GOROOT_BOOTSTRAP="$(go env GOROOT)" \
	\
	&& wget -q "$GOLANG_SRC_URL" -O golang.tar.gz \
	&& echo "$GOLANG_SRC_SHA256  golang.tar.gz" | sha256sum -c - \
	&& mkdir -p  "$GOBUILDDIR" \
	&& tar -C "$GOBUILDDIR" -xzf golang.tar.gz \
	&& rm golang.tar.gz \
	&& cd "$GOBUILDDIR/go/src" \
	&& ./make.bash \
	&& apk del .build-deps 

ENV GOROOT="$GOBUILDDIR/go"
ENV GOPATH="$GOBUILDDIR/godev"
ENV PATH="$GOPATH/bin:$PATH"

RUN chmod -R 755 "$GOPATH/bin"


RUN apk add --no-cache --virtual .build-deps \
	git \
	make \
	wget \
	unzip \
	curl \
	gcc \
	build-base 

#Install glide
RUN curl https://glide.sh/get | sh


#Create our GOROOT

RUN

ENV GATEKEEPER_SRC="$GOROOT/src/github.com/30x/gatekeeper"
#Check out gatekeeper
RUN mkdir -p "$GATEKEEPER_SRC" \
	&& cd "$GATEKEEPER_SRC" \
	&& git init \
	&& git remote add origin "$GATEKEEPER_URL" \
	&& git fetch origin "$GATEKEEPER_VERSION" \
	&& git checkout "$GATEKEEPER_VERSION" \
	&& make


#Remove build time deps
RUN apk add del .build-deps 
#These steps need to run last so we can keep the intermediate image and not need to constantly build go 1.7
#RUN rm -rf /tmp/localbuild 


#Add the community repo to install go
# RUN echo "@edge/community http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories



# RUN set -ex \

# 	&& apk add --no-cache --virtual .build-deps \
# 		bash \
# 		gcc \
# 		musl-dev \
# 		openssl \
# 	&& apk add --no-cache --virtual .build-deps \
# 		go@edge/community \	

# RUN rm -rf .build-deps