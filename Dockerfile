FROM debian:sid

VOLUME /probeurre-data

RUN apt-get update && \
    apt-get install -y docker.io
	
COPY pipeline.sh /probeurre/pipeline.sh

WORKDIR /probeurre

ENTRYPOINT ["/probeurre/pipeline.sh"]
