FROM arm64v8/node:12.22.10-alpine3.15 as builder

WORKDIR /app
RUN apk update && apk add wget tar xz 
RUN wget https://johnvansickle.com/ffmpeg/builds/ffmpeg-git-arm64-static.tar.xz && tar xvf ffmpeg-git-arm64-static.tar.xz


FROM arm64v8/node:12.22.10-alpine3.15

WORKDIR /app
RUN mkdir -p /usr/local/bin/ffmpeg && mkdir -p /app/share
VOLUME /app/share
COPY --from=builder /app/ffmpeg-git-20220108-arm64-static/ffmpeg /usr/local/bin/ffmpeg
RUN ln -s /usr/local/bin/ffmpeg/ffmpeg /usr/bin/ffmpeg && cd /app && npm install --save m3u8-to-mp4

COPY loader.js .

ENTRYPOINT [ "node", "loader.js" ]