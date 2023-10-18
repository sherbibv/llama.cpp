# llama.cpp Builder

A script designed to fetch the [llama.cpp](https://github.com/ggerganov/llama.cpp) source code and construct a fresh Docker image tailored for the current system.

## Running the script

Once you have cloned the repository and ensured that the script is executable(```sudo chmod +x llama-builder.sh```) initiate the build process by executing the following command:

```./llama-builder.sh <TAG_VERSION>```

Replace **<TAG_VERSION>** with the specific version you wish to assign to the resulting Docker image.
