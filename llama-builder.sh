#!/bin/bash

# Initialize variables with default values
custom_tag=""
cuda_arg=""
tag=""

# Parse command-line arguments
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        --tag)
            tag="$2"
            shift 2
            ;;
        --cuda=1)
            cuda_arg="$1"
            shift
            ;;
        *)
            custom_tag="$1"
            shift
            ;;
    esac
done

# Check if a custom tag and tag are provided
if [ -z "$custom_tag" ] || [ -z "$tag" ]; then
    echo "Usage: $0 --tag <tag> [--cuda=1] <custom_tag>"
    exit 1
fi

# Set the Dockerfile based on the presence of the cuda argument
if [ -n "$cuda_arg" ]; then
    dockerfile=".devops/full-cuda.Dockerfile"
else
    dockerfile=".devops/full.Dockerfile"
fi

repository_name="local/llama.cpp:$custom_tag"

# Install necessary building tools
apt install cmake
apt install build-essential

# Clone the llama.cpp repository
git clone https://github.com/ggerganov/llama.cpp.git

# Build the Docker image with the custom tag and chosen Dockerfile
cd llama.cpp
docker build -t "$repository_name:$tag" -f "$dockerfile" .

# Performing cleanup
cd ../
rm -rf llama.cpp
