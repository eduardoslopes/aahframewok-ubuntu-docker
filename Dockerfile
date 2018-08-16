# FROM partlab/ubuntu
FROM vcatechnology/linux-mint

LABEL maintainer="Eduardo Lopes <eduardo.lopes.es@gmail.com>"
LABEL based="partlab/ubuntu-golang"
LABEL based="aahframework/aah"

ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No
ENV LANG en_US.UTF-8
ENV GOVERSION 1.10.3
ENV GOPATH /usr/local

ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN apt-get update

RUN apt-get install -y wget git

RUN wget https://storage.googleapis.com/golang/go${GOVERSION}.linux-amd64.tar.gz && \
    tar -C ${GOPATH} -xzf go${GOVERSION}.linux-amd64.tar.gz && rm go${GOVERSION}.linux-amd64.tar.gz

RUN go version

RUN go get -u aahframework.org/tools.v0/aah && \
    go get -u github.com/aah-cb/minify

RUN aah switch && \
    aah switch --refresh

RUN aah --version

WORKDIR $GOPATH/src