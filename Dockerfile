FROM ubuntu:18.04

RUN apt-get update; apt-get --yes dist-upgrade; apt-get install --yes curl; curl -sL https://deb.nodesource.com/setup_10.x | bash -; apt-get install -y nodejs;
