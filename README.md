# llama.cpp Builder

A script designed to fetch the [llama.cpp](https://github.com/ggerganov/llama.cpp) source code and construct a fresh Docker image tailored for the current system.

## Running the script

Once you have cloned the repository and ensured that the script is executable(```sudo chmod +x llama-builder.sh```) initiate the build process by executing the following command:

```./llama-builder.sh --tag <TAG_VERSION>```

Replace **<TAG_VERSION>** with the specific version you wish to assign to the resulting Docker image. 

## Running inference

### Preqequisites

To perform inference, you must first obtain a .gguf model, such as [CodeLlama-7B-Instruct-GGUF](https://huggingface.co/TheBloke/CodeLlama-7B-Instruct-GGUF).

### Running the llama.cpp container

Once you have created the Docker image, launch it using the llama.cpp stack (link coming soon). Customize the command parameters to suit your specific requirements. For guidance, please refer to [this](https://github.com/ggerganov/llama.cpp/blob/master/examples/server/README.md) documentation.

### Connecting Continue to the llama.cpp server

Integrate the [Continue plugin](https://github.com/continuedev/continue) into your Integrated Development Environment (IDE), such as IntelliJ or Visual Studio. Navigate to the configuration file and modify the ```models``` field as shown in the example. To connect to the llama.cpp endpoint, you'll need to provide the Cloudflare client ID and client secret. Additionally, ensure that you expose the service through Cloudflare tunnels and secure it using [Service Auth](https://developers.cloudflare.com/cloudflare-one/identity/service-tokens/).

```
models=Models(
  default=LlamaCpp(
    title="CodeLLamaSH",
    model="codellama:7b-instruct",
    system_message="",
    headers={'CF-Access-Client-Id': 'CLIENT_ID', 'CF-Access-Client-Secret': 'CLIENT_SECRET'},
    server_url="URL_TO_SERVER_RUNNING_LLAMA.CPP"
  ),
  saved=[]
)
```

Obs: ```LlamaCpp``` object name needs to stay as is, you can only customize its properties.
