FROM ubuntu:18.04

RUN apt-get update; apt-get --yes dist-upgrade; apt-get install --yes curl gnupg build-essential software-properties-common unzip git zip; curl -sL https://deb.nodesource.com/setup_10.x | bash -; add-apt-repository -y ppa:longsleep/golang-backports; apt-get install -y nodejs golang-go; curl -o /tmp/protoc.zip -L https://github.com/protocolbuffers/protobuf/releases/download/v3.6.1/protoc-3.6.1-linux-x86_64.zip; cd /tmp; unzip protoc.zip -d protoc3; mv protoc3/bin/* /usr/local/bin/; mv protoc3/include/* /usr/local/include/; chown root:root /usr/local/bin/protoc; chown -R root:root /usr/local/include/google; chmod -R a+rX /usr/local/include/*; mkdir /development;
RUN go get slickqa/slick; cd /development/go/src/github.com/slickqa/slick; make deps; cd ..; rm -rf slick

ENV GOPATH=/development/go
ENV GOCACHE=/development/.cache/go-build
ENV PATH=/development/go/bin:/usr/local/bin:/usr/bin/:/bin:/usr/local/sbin:/usr/sbin:/sbin
