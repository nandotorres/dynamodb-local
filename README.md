# dynamodb-local

Basic docker image for local development with AWS DynamoDB

## Running image

`docker run -it -p 8000:8000 -v /my/local/data/files:/dynamodb-data nandotorres/dynamodb-local`

## Testing

In order to test if the container is working as expected we can use the *aws dynamodb cli*

`aws dynamodb list-tables --endpoint-url http://localhost:8000`

``` 
{
    "TableNames": []
}
```

Don't miss to especify the parameter `--endpoint-url` to point to localhost on the port you bind your dynamodb container.

### Create a new table

`aws dynamodb create-table --table-name MusicCollection --attribute-definitions AttributeName=Artist,AttributeType=S AttributeName=SongTitle,AttributeType=S --key-schema AttributeName=Artist,KeyType=HASH AttributeName=SongTitle,KeyType=RANGE --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 --endpoint-url http://localhost:8000`

```
{
    "TableDescription": {
        "TableArn": "arn:aws:dynamodb:ddblocal:000000000000:table/MusicCollection", 
        "AttributeDefinitions": [
            {
                "AttributeName": "Artist", 
                "AttributeType": "S"
            }, 
            {
                "AttributeName": "SongTitle", 
                "AttributeType": "S"
            }
        ], 
        "ProvisionedThroughput": {
            "NumberOfDecreasesToday": 0, 
            "WriteCapacityUnits": 5, 
            "LastIncreaseDateTime": 0.0, 
            "ReadCapacityUnits": 5, 
            "LastDecreaseDateTime": 0.0
        }, 
        "TableSizeBytes": 0, 
        "TableName": "MusicCollection", 
        "TableStatus": "ACTIVE", 
        "KeySchema": [
            {
                "KeyType": "HASH", 
                "AttributeName": "Artist"
            }, 
            {
                "KeyType": "RANGE", 
                "AttributeName": "SongTitle"
            }
        ], 
        "ItemCount": 0, 
        "CreationDateTime": 1490622433.359
    }
}
```

