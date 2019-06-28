FROM arm32v7/alpine as base
RUN apk add curl bash git

FROM alpine as build
RUN apk add curl bash git

COPY filebrowser.sh filebrowser.sh
RUN chmod +x filebrowser.sh
RUN filebrowser.sh

FROM base as final
COPY --from=build /usr/bin/filebrowser /usr/bin/filebrowser
RUN chmod +x /usr/bin/filebrowser
RUN mkdir /config
COPY config.json filebrowser.json

RUN mkdir /db
VOLUME ["/db"]
EXPOSE 80

ENTRYPOINT ["filebrowser"]