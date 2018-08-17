# Auth0 AD/LDAP Connector in Docker image

Dockerized version of [Auth0 AD/LDAP Connector](https://github.com/auth0/ad-ldap-connector) by [Brainbean Apps](https://brainbeanapps.com)

## Usage

```bash
docker run \
  --name auth0-connector \
  --net=host \
  -v /data/auth0-connector/cache:/opt/auth0-connector/cache.db:rw \
  -v /data/auth0-connector/certs:/opt/auth0-connector/certs:ro \
  -v /data/auth0-connector/config.json:/opt/auth0-connector/config.json:ro \
  -v /data/auth0-connector/profileMapper.js:/opt/auth0-connector/lib/profileMapper.js:ro \
  brainbeanapps/auth0-ad-ldap-connector:4.1.2
```