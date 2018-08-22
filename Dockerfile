FROM  ubuntu:16.04
LABEL maintainer="Umesh Bhosale"

ENV DEBIAN_FRONTEND=noninteractive \
    # ANDROID_HOME=/opt/android-sdk-linux \
    NODE_VERSION=8.9.4 \
    NPM_VERSION=5.6.0 \
    IONIC_VERSION=3.20.0 \
    CORDOVA_VERSION=7.1.0 \
    GRADLE_VERSION=4.5.1

# Install basics
RUN apt-get update &&  \
    apt-get install -y git wget curl unzip build-essential ruby ruby-dev ruby-ffi gcc make vim && \
    curl --retry 3 -SLO "http://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz" && \
    tar -xzf "node-v$NODE_VERSION-linux-x64.tar.gz" -C /usr/local --strip-components=1 && \
    rm "node-v$NODE_VERSION-linux-x64.tar.gz" && \
    npm install -g npm@"$NPM_VERSION" && \
    npm install -g cordova@"$CORDOVA_VERSION" ionic@"$IONIC_VERSION" && \
    npm cache clear --force && \
    gem install sass
    # git config --global user.email "umesh_b@techjoomla.com" && \
    # git config --global user.name "umesh_b" && \
    # ionic start myApp sidemenu --no-interactive

# ANDROID
# Set up environment variables
ENV ANDROID_HOME="/home/user/android-sdk-linux" \
    SDK_URL="https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip" \
    GRADLE_URL="https://services.gradle.org/distributions/gradle-4.5.1-all.zip"

# Create a non-root user
RUN useradd -m user
USER user
WORKDIR /home/user

# Download Android SDK
RUN mkdir $ANDROID_HOME .android \
 && cd $ANDROID_HOME \
 && curl -o sdk.zip $SDK_URL \
 && unzip sdk.zip \
 && rm sdk.zip \
 && yes | $ANDROID_HOME/tools/bin/sdkmanager --licenses

# Install Gradle
RUN wget $GRADLE_URL -O gradle.zip \
 && unzip gradle.zip \
 && mv gradle-4.5.1 gradle \
 && rm gradle.zip \
 && mkdir .gradle

#JAVA
RUN apt-get update && apt-get install -y -q python-software-properties software-properties-common  && \
    add-apt-repository ppa:webupd8team/java -y && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get update && apt-get -y install oracle-java8-installer

# Set up environment variables
ENV PATH="/home/user/gradle/bin:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${PATH}"

RUN android update sdk --no-ui --filter extra-android-support,extra-google-m2repository,extra-android-m2repository
RUN android update sdk --no-ui --filter build-tools-24.0.0,android-24
RUN android update sdk --no-ui --filter build-tools-26.0.0,android-26
RUN android update sdk --no-ui --filter platform-tools,tools

RUN mkdir app
RUN cd app

# RUN npm i @ionic-tools/emoji-picker --save --force

WORKDIR app
EXPOSE 8100 35729
CMD ["ionic", "serve"]
