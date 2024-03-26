FROM ubuntu:20.04 as builder

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

ADD . ./workdir
WORKDIR "/workdir"

RUN ls

# Create output folder
RUN mkdir -p output

VOLUME ["/output"]
CMD cp ./target/release/avail-node /output
