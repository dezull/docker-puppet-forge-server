# Docker image for [Puppet Forge Server](https://github.com/kindredgroup/puppet-forge-server)

## Build Docker Image

```shell
git clone https://github.com/dezull/docker-puppet-forge-server.git
cd docker-puppet-forge-server
DOCKER_BUILDKIT=1 docker build -t puppetforge .
```

## Usage

```shell
mkdir cache
docker run -p 8080:8080 --mount type=bind,source="$(pwd)/cache",target=/puppet-forge-server/cache puppetforge 
```
