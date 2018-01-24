FROM ubuntu:16.04

MAINTAINER Jeremy Magland

# Node JS
RUN apt-get update && apt-get install -y nodejs nodejs-legacy

# Octave (and transfig for fig2dev)
RUN apt-get update && apt-get install -y octave
RUN apt-get update && apt-get install -y transfig

ADD . /package

# Build
WORKDIR /package
RUN ./ml_phret.mp spec > ml_phret.spec

