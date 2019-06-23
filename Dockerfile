FROM node:8.13.0-alpine

RUN set -xe \
    && apk add --no-cache bash git openssh

RUN mkdir -p /app
RUN chown -R node /app

WORKDIR /app

USER node

COPY ./node_modules /app/node_modules

ENTRYPOINT ["node"]
CMD ["/app/node_modules/@nebulario/tracker-server/dist/index.js"]


# Move to build server, only dependency is git
#RUN apk update
#RUN apk add --no-cache python py-pip
#ENV PATH=/root/.local/bin:$PATH
#RUN pip install awscli --upgrade
#RUN aws --version
#RUN apk add docker
#RUN apk --no-cache add shadow
#RUN usermod -aG docker node
