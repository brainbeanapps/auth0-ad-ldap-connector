FROM node:8-alpine

ARG VERSION=4.1.2

WORKDIR /opt/auth0-connector

RUN apk add --no-cache --virtual .build-deps-auth0-connector ca-certificates curl g++ git make openssl python && \
  curl -fsSLo /opt/auth0-connector.tar.gz https://github.com/auth0/ad-ldap-connector/archive/v${VERSION}.tar.gz && \
  tar -xzf /opt/auth0-connector.tar.gz -C /opt/auth0-connector --strip-components=1 && \
  rm -f /opt/auth0-connector.tar.gz

RUN cd /opt/auth0-connector && \
  npm install

ENV PROVISIONING_TICKET=
ENV LDAP_URL=
ENV LDAP_BASE=
ENV LDAP_BIND_USER=
ENV LDAP_BIND_PASSWORD=
ENV LDAP_BIND_CREDENTIALS=

ENTRYPOINT [ "node", "/opt/auth0-connector/server.js" ]
