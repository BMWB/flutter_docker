FROM ubuntu:latest

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
