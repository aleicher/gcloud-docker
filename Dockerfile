FROM docker:stable-git
LABEL maintainer="Andreas Leicher <email@andreasleicher.com>"

ENV SDK_VERSION="214.0.0"

RUN apk add --update --no-cache python make

RUN wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${SDK_VERSION}-linux-x86_64.tar.gz && \
    tar -xzvf google-cloud-sdk-${SDK_VERSION}-linux-x86_64.tar.gz && \
    /google-cloud-sdk/install.sh -q && \
    ln -s /google-cloud-sdk/bin/* /usr/local/bin && \
    gcloud --version && \
rm google-cloud-sdk-${SDK_VERSION}-linux-x86_64.tar.gz
