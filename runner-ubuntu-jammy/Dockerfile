FROM ubuntu:22.04

ARG RUNNER_VERSION=2.322.0
ARG TOKEN

ENV DEBIAN_FRONTEND=noninteractive
ENV RUNNER_ALLOW_RUNASROOT=1

WORKDIR /runner

RUN apt update && \
	apt install -y curl jq git sudo && \
	rm -rf /var/lib/apt/lists/*

RUN curl -o actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz && \
    tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz && \
    rm ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz

RUN ./bin/installdependencies.sh

ADD start.sh /start.sh

CMD [ "/start.sh" ]