# Apache Kafka in docker

## How to build

```bash
cd debian-12-ranger
docker build -t <YOUR_KAFKA_IMAGE>:<YOUR_KAFKA_VERSION> .

# Examples
docker build -t vintos/apache-kafka:3.9.0-ranger .
```

## How to run

```bash
docker compose up -d
```
