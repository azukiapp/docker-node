FROM azukiapp/alpine
MAINTAINER Azuki <support@azukiapp.com>

# NodeJS or IOJS
# ENV VERSION=v0.10.9 CMD=node DOMAIN=nodejs.org CFLAGS="-D__USE_MISC"
ENV VERSION=v0.11.9 CMD=node DOMAIN=nodejs.org
ENV NPM_VERSION=2.11.3

RUN  DEL_PACKS="make gcc g++ python linux-headers paxctl python c-ares-dev paxmark openssl-dev zlib-dev" \
  && apk add libcrypto1.0 libgcc libstdc++ libuv-dev $DEL_PACKS \
  && cd /var/tmp \
  && curl -SL https://${DOMAIN}/dist/${VERSION}/${CMD}-${VERSION}.tar.gz | tar -xz \
  && CONFIG_FLAGS="--shared-zlib --shared-libuv --shared-openssl" \
  && cd ${CMD}-${VERSION} \
  && ./configure --prefix=/usr ${CONFIG_FLAGS} \
  && make \
  && make install \
  && paxctl -cm /usr/bin/${CMD} \
  && apk del ${DEL_PACKS} \
  && rm -rf /var/cache/apk/* /var/tmp/* /etc/ssl /usr/include \
    /usr/share/man /root/.node-gyp \
  && cd / \
  if [ -x /usr/bin/npm -a -n "${NPM_VERSION}" ]; then \
    npm install -g npm@"${NPM_VERSION}" \
    && npm cache clear \
  fi \
  rm -rf /tmp/* /root/.npm /usr/lib/node_modules/npm/man \
    /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html

CMD [ "node" ]
