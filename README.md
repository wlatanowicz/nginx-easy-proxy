nginx-easy-proxy
===

Dockerized nginx with templated config to quickly setup a proxy server.

Generates nginx proxy configuration based on environment variables. Each proxied server requires two settings: backend url and location on proxy server. Every request matching the location's path will be redirected to the specified backend. You can have multiple path-backend pairs. eg.:

```
# .env
LOCATION[wl]=/wl
BACKEND[wl]=https://wiktor.latanowicz.com
LOCATION[google]=/google
BACKEND[google]=https://www.google.com/
```

Image is available on the docker hub:

```
docker run --env-file .env wlatanowicz/nginx-easy-proxy
```
