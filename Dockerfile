# if debian/ubuntu: also install node-gyp

FROM frolvlad/alpine-glibc:alpine-3.10_glibc-2.29 as installed

RUN set -ex; \
    apk update; \
    apk add --no-cache \
        git \
        bash \
        nano \
        ncdu \
        npm \
        yarn \
        make \
        g++ \
        python3 \
        openjdk11

ENV ANDROID_HOME "/opt/sdk"
ENV CMDLINE_VERSION "3.0"
ENV SDK_TOOLS "6858069"
ENV PATH $PATH:${ANDROID_HOME}/cmdline-tools/${CMDLINE_VERSION}/bin:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/extras/google/instantapps

# Install required dependencies
RUN apk add --no-cache bash git unzip wget && \

    apk add --virtual .rundeps $runDeps && \

    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/*

# Download and extract Android Tools
RUN wget -q https://dl.google.com/android/repository/commandlinetools-linux-${SDK_TOOLS}_latest.zip -O /tmp/tools.zip && \

    mkdir -p ${ANDROID_HOME}/cmdline-tools && \
    unzip -qq /tmp/tools.zip -d ${ANDROID_HOME}/cmdline-tools && \
    mv ${ANDROID_HOME}/cmdline-tools/* ${ANDROID_HOME}/cmdline-tools/${CMDLINE_VERSION} && \
    rm -v /tmp/tools.zip

# Install SDK Packages
RUN mkdir -p ~/.android/ && touch ~/.android/repositories.cfg && \

    yes | sdkmanager --sdk_root=${ANDROID_HOME} --licenses && \
    sdkmanager --sdk_root=${ANDROID_HOME} --install "platform-tools" "extras;google;instantapps"


ENV ANDROID_SDK_ROOT="/home/appuser/app/sdk" \
    ANDROID_HOME="/home/appuser/app/sdk" \
    NODE_ENV="development" \
    NODE_OPTIONS="--max-old-space-size=8192" \
    PASSPHRASE_WALLET_DEFAULT="A1TeleocomPass" \
    PASSWORD_SECRET_KEY="PassSecretKey" \
    PASS_HOSPOT="HosPttyPass" \
    API_MINER_URL="https://api-service.incognito.org" \
    NODE_PASSWORD="" \      
    NODE_USER_NAME=""

RUN set -ex
RUN mkdir -p "/home/appuser/app/sdk/licenses" "/home/appuser/app/incognito/"
RUN printf "\n24333f8a63b6825ea9c5514f83c2829b004d1fee" > "/home/appuser/app/sdk/licenses/android-sdk-license"
RUN cd /home/appuser/app/incognito/
COPY . /home/appuser/app/incognito/incognito-wallet
RUN --mount=type=bind,source=./package.json,target=./package.json
#RUN yarn install --ignore-engines

RUN --mount=type=bind,source=./src,target=./src 
#RUN --mount=type=bind,source=./node_modules,target=./node_modules \
#RUN   ls ./src
 #--mount=type=bind,source=./package.json,target=./package.json \
   
#RUN --mount=target=./src ./src
#    --mount=type=cache,target=./node_modules/
#    --mount=type=cache,target=/go/pkg \
#    GOOS=$TARGETOS GOARCH=$TARGETARCH go build -o /out/myapp .

#RUN git clone https://github.com/incognitochain/incognito-wallet
WORKDIR /home/appuser/app/incognito/incognito-wallet

#RUN cp ./.sample.env ./.env
RUN printf "NODE_PASSWORD=\nNODE_USER_NAME=" >> .\.env
RUN keytool -genkey -v -keystore /home/appuser/app/incognito/incognito-wallet/android/app/wallet-app-release-key.keystore -alias wallet-app-key-alias -storepass 123456 -keypass 123456 -keyalg RSA -keysize 2048 -validity 10000 -dname CN=IL
RUN rm -rf /home/appuser/app/incognito/incognito-wallet/android/app/src/main/assets/fonts
EXPOSE 8081
EXPOSE 5037
EXPOSE 5555
#RUN cd /home/appuser/app/incognito/incognito-wallet/android/app/build/outputs/apk/debug
ENTRYPOINT ["tail"]
CMD ["-f","/dev/null"]

#from installed as  RUN yarn buildDebug

#ENTRYPOINT ["tail"]
#CMD ["-f","/dev/null"]
#RUN   git checkout 4.5.1
    # yarn postinstall;
    #    yarn install --ignore-engines --frozen-lockfile --production ; \
#    yarn install --ignore-engines; \
    #cd android; \
    #printf "#!/bin/sh\n/bin/true" > /home/appuser/app/incognito/incognito-wallet/node_modules/@react-native-community/cli/setup_env.sh; \
    # ./gradlew assembleRelease