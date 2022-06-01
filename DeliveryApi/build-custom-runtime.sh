#!/bin/sh

# Remove a previously created custom runtime
file="runtime.zip"
if [ -f "$file" ] ; then
    rm "$file"
fi

# Build the custom Java runtime from the LambdaCustomRuntimeBuilder
docker build -f LambdaCustomRuntimeBuilder --progress=plain -t lambda-custom-runtime-minimal-jre-11-x86 .

# Extract the runtime.zip from the Docker environment and store it locally
docker run --rm --entrypoint cat lambda-custom-runtime-minimal-jre-11-x86 runtime.zip > runtime.zip
