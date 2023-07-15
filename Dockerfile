FROM ubuntu:latest

# Prerequisites
RUN apt update && apt install -y curl git unzip xz-utils zip libglu1-mesa openjdk-8-jdk wget

# Setup new user
RUN useradd -ms /bin/bash developer
USER developer
WORKDIR /home/developer

RUN apt-get update && \
    apt-get install -y curl git && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g flutter

RUN cd /opt && \
    curl -o android-sdk.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip && \
    unzip android-sdk.zip && \
    rm android-sdk.zip && \
    yes | /opt/tools/bin/sdkmanager --licenses && \
    /opt/tools/bin/sdkmanager "build-tools;30.0.3" "platforms;android-29" "platform-tools" && \
    mkdir /root/.android && \
    touch /root/.android/repositories.cfg && \
    echo 'export ANDROID_HOME=/opt' >> /root/.bashrc && \
    echo 'export PATH=$PATH:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools' >> /root/.bashrc

RUN apt-get install -y build-essential && \
    apt-get install -y ruby-full && \
    gem install cocoapods && \
    xcode-select --install


# Download Flutter SDK
RUN git clone https://github.com/flutter/flutter.git
ENV PATH "$PATH:/home/developer/flutter/bin"

# Run basic check to download Dark SDK
RUN flutter doctor