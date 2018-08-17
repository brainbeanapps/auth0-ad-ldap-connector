FROM node:8-alpine

ARG VERSION=v4.1.2

WORKDIR /opt/auth0-connector

RUN apk add --no-cache --virtual .build-deps-auth0-connector ca-certificates curl g++ git make openssl python && \
  curl -fsSLo /opt/auth0-connector.tar.gz https://github.com/auth0/ad-ldap-connector/archive/${VERSION}.tar.gz && \
  tar -xzf /opt/auth0-connector.tar.gz -C /opt/auth0-connector --strip-components=1 && \
  rm -f /opt/auth0-connector.tar.gz

RUN cd /opt/auth0-connector && \
  sed -i 's/https:\/\/github.com\/auth0\/cookie-sessions\/tarball\/master/https:\/\/github.com\/auth0\/cookie-sessions\/tarball\/a192c158c8f1b40e4f248cb3242171869cbb48d9/' package.json && \
  npm install

ENTRYPOINT [ "node", "/opt/auth0-connector/server.js" ]
