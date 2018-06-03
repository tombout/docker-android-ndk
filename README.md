# docker-android-ndk
This Docker image contains an Android NDK. It is based on buildpack-deps:jessie.

## Example usage
Create a Dockerfile in your project that inherits from this image. In the Dockerfile create a toolchain with the NDK 
tools and prepend the toolchain/bin directory to $PATH. 

```dockerfile
FROM tombout/android-ndk:latest
ENV NDK_TOOLCHAIN="/opt/ndk-toolchain"
RUN $ANDROID_NDK_HOME/build/tools/make_standalone_toolchain.py \
    --arch arm --api 26 \
    --install-dir ${NDK_TOOLCHAIN} \
    --stl=libc++
ENV PATH=${NDK_TOOLCHAIN}/bin:${PATH}
WORKDIR /root
```

Then build your Dockerfile and start a new container with interactive bash from the new image.

```bash
docker build -t toolchain .
docker run --rm -it -v ${PWD}:/root toolchain bash
```

Now, with your current project directory mounted to the toolchain container, you can run your build scripts for the 
native code.
