# The container includes:
#
# azukiapp/node:
# * Node 0.11.14
#

FROM azukiapp/web-based
MAINTAINER Azuki <support@azukiapp.com>

# verify gpg and sha256: http://nodejs.org/dist/v0.12.0/SHASUMS256.txt.as7
# gpg: aka "Timothy J Fontaine (Work) <tj.fontaine@joyent.com>"
RUN gpg --keyserver pgp.mit.edu --recv-keys 7D33FF9D0246406D

ENV NODE_VERSION 0.11.14
ENV NPM_VERSION 2.0.0

RUN curl -SLO "http://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz" \
    && curl -SLO "http://nodejs.org/dist/v$NODE_VERSION/SHASUMS256.txt.asc" \
    && gpg --verify SHASUMS256.txt.asc \
    && grep " node-v$NODE_VERSION-linux-x64.tar.gz\$" SHASUMS256.txt.asc | sha256sum -c - \
    && tar -xzf "node-v$NODE_VERSION-linux-x64.tar.gz" -C /usr/local --strip-components=1 \
    && rm "node-v$NODE_VERSION-linux-x64.tar.gz" SHASUMS256.txt.asc \
    && npm install -g npm@"$NPM_VERSION" \
    && npm cache clear

CMD [ "node" ]
