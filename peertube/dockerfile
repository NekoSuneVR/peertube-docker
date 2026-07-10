FROM node:20-bookworm

LABEL maintainer="NekoSuneVR"
LABEL org.opencontainers.image.title="PeerTube"
LABEL org.opencontainers.image.description="PeerTube v6.3.3 built from Git tag"
LABEL org.opencontainers.image.version="6.3.3"

ENV NODE_ENV=production
ARG PEERTUBE_VERSION=v6.3.3
ENV PEERTUBE_VERSION=${PEERTUBE_VERSION}

# Install build dependencies
RUN apt-get update && apt-get install -y \
    git \
    ffmpeg \
    python3 \
    make \
    g++ \
    curl \
    wget \
    unzip \
    imagemagick \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Clone the exact Git tag (not --branch)
RUN git init . \
    && git remote add origin https://github.com/Chocobozzz/PeerTube.git \
    && git fetch --depth 1 origin refs/tags/${PEERTUBE_VERSION}:refs/tags/${PEERTUBE_VERSION} \
    && git checkout tags/${PEERTUBE_VERSION}

# Install dependencies
RUN npm ci

# Build PeerTube
RUN npm run build

# Create required directories
RUN mkdir -p \
    /data \
    /config \
    /app/storage

EXPOSE 9000

VOLUME ["/data", "/config", "/app/storage"]

CMD ["node", "dist/server"]
