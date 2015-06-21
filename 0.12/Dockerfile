FROM azukiapp/alpine
MAINTAINER Azuki <support@azukiapp.com>

RUN apk add python openssl-dev zlib-dev libuv-dev c-ares-dev paxmark libuv-dev linux-headers

# NodeJS or IOJS
# ENV VERSION=v0.10.9 CMD=node DOMAIN=nodejs.org CFLAGS="-D__USE_MISC"
# ENV VERSION=v0.11.9 CMD=node DOMAIN=nodejs.org
ENV VERSION=v0.12.4 CMD=node DOMAIN=nodejs.org
RUN curl -SL https://${DOMAIN}/dist/${VERSION}/${CMD}-${VERSION}.tar.gz | tar -xz

RUN  cd ${CMD}-${VERSION} \
  && ./configure --prefix=/usr

RUN  cd ${CMD}-${VERSION} \
  && make

RUN  cd ${CMD}-${VERSION} \
  && make install
