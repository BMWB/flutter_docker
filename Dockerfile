FROM ubuntu:latest

# 安装必要的软件包
RUN apt-get update && apt-get install -y curl git unzip xz-utils zip libglu1-mesa openjdk-8-jdk wget

# 安装 Android SDK
RUN wget https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip && \
    unzip sdk-tools-linux-4333796.zip -d /opt/android-sdk && \
    rm sdk-tools-linux-4333796.zip

ENV ANDROID_HOME /opt/android-sdk
ENV PATH $PATH:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools

RUN yes | sdkmanager --licenses
RUN sdkmanager "platform-tools" "platforms;android-30"

# 安装 Flutter SDK
RUN wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.10.6-stable.tar.xz && \
    tar xf flutter_linux_3.10.6-stable.tar.xz && \
    rm flutter_linux_3.10.6-stable.tar.xz

ENV FLUTTER_HOME /flutter
ENV PATH $PATH:$FLUTTER_HOME/bin

# 安装 iOS 开发环境
RUN xcode-select --install

# 清理缓存
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN flutter doctor