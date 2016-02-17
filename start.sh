#!/bin/bash

: ${URL:=http://localhost:4567}
: ${DB_MONGO_HOST:=mongo}
: ${DB_MONGO_PORT:=27017}
: ${DB_MONGO_USERNAME:=nodebb}
: ${DB_MONGO_PASSWORD:=}
: ${DB_MONGO_NAME=nodebb}
: ${DB_REDIS_HOST:=redis}
: ${DB_REDIS_PORT:=6379}
: ${DB_REDIS_NAME:=0}

cat << EOF > config.json
{
    "url": "$URL",
    "secret": "8fff36b8-5968-4b5f-9ebd-4661d0e90aaf",
    "database": "mongo",
    "mongo": {
        "host": "$DB_MONGO_HOST",
        "port": "$DB_MONGO_PORT",
        "username": "$DB_MONGO_USERNAME",
        "password": "$DB_MONGO_PASSWORD",
        "database": "$DB_MONGO_NAME"
    },
    "redis": {
        "host": "$DB_REDIS_HOST",
        "port": "$DB_REDIS_PORT",
        "database": "$DB_REDIS_NAME"
    }
}
EOF

./nodebb start && tail -f ./logs/output.log
