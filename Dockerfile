FROM buildpack-deps:jessie

MAINTAINER Thomas Schmitz <thomas.schmitz80@gmail.com>
LABEL version="1.0.0"

ARG ANDROID_NDK_BUILD="r17"
ENV ANDROID_NDK_HOME="/opt/android-ndk-${ANDROID_NDK_BUILD}"
ENV NDK_TOOLCHAIN="/opt/ndk-toolchain"

# Install required dependencies
RUN dpkg --add-architecture i386 \
  && apt-get update && apt-get install -y --no-install-recommends \
  wget \
  unzip \
  && rm -rf /var/lib/apt/lists/* \
# Install ndk
  && wget -O android-ndk.zip http://dl.google.com/android/repository/android-ndk-${ANDROID_NDK_BUILD}-linux-x86_64.zip \
  && unzip android-ndk.zip -d /opt \
  && rm android-ndk.zip

ENV PATH=${ANDROID_NDK_HOME}/bin:${PATH}
