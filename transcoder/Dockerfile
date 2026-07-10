FROM node:20-bookworm

LABEL org.opencontainers.image.title="PeerTube Remote Transcoder"

ARG PEERTUBE_VERSION=v6.3.3

ENV NODE_ENV=production
ENV PEERTUBE_VERSION=${PEERTUBE_VERSION}

RUN apt-get update && apt-get install -y \
    git \
    ffmpeg \
    python3 \
    make \
    g++ \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /transcoder

RUN git clone \
    --depth 1 \
    --branch ${PEERTUBE_VERSION} \
    https://github.com/Chocobozzz/PeerTube.git \
    .

RUN corepack enable

RUN yarn install --production=false

RUN yarn build

WORKDIR /app

COPY start-transcoder.sh .

RUN chmod +x start-transcoder.sh

CMD ["./start-transcoder.sh"]
