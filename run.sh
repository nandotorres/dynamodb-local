#!/bin/sh

java -Djava.library.path=./DynamoDBLocal_lib -jar DynamoDBLocal.jar -sharedDb -optimizeDbBeforeStartup -dbPath /dynamodb-data -optimizeDbBeforeStartup