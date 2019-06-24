FROM node:8.13.0-alpine

RUN set -xe \
    && apk add --no-cache bash git openssh

RUN mkdir -p /app
RUN chown -R node /app

WORKDIR /app

USER node

ARG CACHEBUST=1
COPY ./node_modules /app/node_modules

ENTRYPOINT ["node"]
CMD ["/app/node_modules/@nebulario/tracker-server/dist/index.js"]
