FROM ubuntu:20.04
LABEL Author="Rob Hofmann <rob.hofmann@me.com>"

RUN apt-get -q update && \
    apt-get -qy dist-upgrade && \
    apt-get install -y --no-install-recommends \
         rsync \
         libunwind8 \
         git-core cron wget jq && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/*

COPY ./entrypoint.sh /entrypoint.sh
COPY ./runCleaner.sh /scripts/runCleaner.sh
RUN chmod u+x /entrypoint.sh
RUN chmod u+x /scripts/runCleaner.sh

ENTRYPOINT ["/entrypoint.sh"]
