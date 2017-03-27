FROM openjdk:8

RUN mkdir -p /dynamodb && \
    mkdir -p /dynamodb-data && \
    cd /dynamodb && \
    wget https://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_latest.tar.gz && \
    tar xzvf dynamodb_local_latest.tar.gz && \
    rm -f dynamodb_local_latest.tar.gz

COPY run.sh /dynamodb

RUN chmod +x /dynamodb/run.sh

WORKDIR /dynamodb

EXPOSE 8000

CMD ["./run.sh"]
