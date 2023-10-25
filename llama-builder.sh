#!/bin/bash

# Check if a custom tag was provided as a command-line argument
if [ -z "$1" ]; then
    echo "Usage: $0 <custom_tag>"
    exit 1
fi

# Install necesarry building tools
apt install cmake
apt install build-essential

custom_tag="$1"
repository_name="local/llama.cpp:$custom_tag"

# Clone the llama.cpp repository
git clone https://github.com/ggerganov/llama.cpp.git

# Build the Docker image with the custom tag
cd llama.cpp
docker build -t "$repository_name" -f .devops/full.Dockerfile .

# Performing cleanup
cd ../
