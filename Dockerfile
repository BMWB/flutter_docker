FROM ubuntu:latest

# 安装必要的软件包
RUN apt-get update && \
    apt-get install -y curl git unzip xz-utils zip libglu1-mesa openjdk-8-jdk wget && \
    rm -rf /var/lib/apt/lists/*
# Setup new user
RUN useradd -ms /bin/bash developer
USER developer
WORKDIR /home/developer

# Prepare Android directories and system variables
RUN mkdir -p Android/sdk
ENV ANDROID_SDK_ROOT /home/developer/Android/sdk
RUN mkdir -p .android && touch .android/repositories.cfg

# Setup Android SDK
RUN wget -O sdk-tools.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
RUN unzip sdk-tools.zip && rm sdk-tools.zip
RUN mv tools Android/sdk/tools
# RUN cd Android/sdk/tools/bin && yes | ./sdkmanager --licenses
# RUN cd Android/sdk/tools/bin && ./sdkmanager "build-tools;29.0.2" "patcher;v4" "platform-tools" "platforms;android-29" "sources;android-29"
# ENV PATH "$PATH:/home/developer/Android/sdk/platform-tools"

# ENV ANDROID_HOME /opt/android-sdk
ENV PATH $PATH:$ANDROID_SDK_ROOT/tools/bin:$ANDROID_SDK_ROOT/platform-tools

RUN yes | sdkmanager --licenses
RUN sdkmanager "platform-tools" "platforms;android-30"

# Download Flutter SDK
RUN git clone https://github.com/flutter/flutter.git
ENV PATH "$PATH:/home/developer/flutter/bin"

# # 安装 iOS 开发环境
# RUN xcode-select --install

# # 安装 iOS 模拟器
# RUN yes | sudo xcode-select --switch /Applications/Xcode.app && \
#     sudo xcodebuild -runFirstLaunch && \
#     sudo xcodebuild -sdk iphonesimulator -version

# 清理缓存
# RUN apt-get clean && \
    # rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN flutter doctor