#!/bin/bash

echo "Starting PeerTube Remote Transcoder"

cd /transcoder

node dist/server/transcoding.js
