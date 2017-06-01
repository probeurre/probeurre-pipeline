FROM ubuntu:latest

VOLUME /probeurre-data

RUN apt-get update && \
    apt-get install -y docker.io
	
COPY pipeline.sh /probeurre/pipeline.sh

WORKDIR /probeurre

EXPOSE 5555

ENTRYPOINT ["/probeurre/pipeline.sh"]
