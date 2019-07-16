FROM amd64/alpine as base

FROM alpine as build
ENV DOCKER_ARCH=amd64
RUN apk add curl bash

COPY filebrowser.sh filebrowser.sh
RUN chmod +x /filebrowser.sh
RUN /filebrowser.sh

FROM base as final
COPY --from=build /usr/local/bin/filebrowser /usr/local/bin/filebrowser
COPY config.json /etc/filebrowser/filebrowser.json

EXPOSE 80
ENTRYPOINT ["filebrowser", "--config", "/etc/filebrowser/filebrowser.json"]