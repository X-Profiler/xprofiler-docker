# xprofiler-docker

通过docker快速启动xprofiler

步骤

1. dclone xprofile-console
1. dclone xprofile-manager
1. touch egg/config files
1. docker build
1. docker-compose

## Requirements

- docker
- docker-compose

## Config

**Compose**

- docker-compose.yml

**Modify Github Id/Secret**

```yml
version: '3'
services: 
  cnode:
    environment:
      - EGG_PASSPORT_GITHUB_CLIENT_ID=test
      - EGG_PASSPORT_GITHUB_CLIENT_SECRET=test
```

**Modify Alinode AppId/Secret**

```yml
version: '3'
services: 
  cnode:
    environment:
      - EGG_ALINODE_APPID=appid
      - EGG_ALINODE_SECRET=secret
```

> to disable alinode, modify config/plugin.prod.js

**Change Port**

```yml
version: '3'
services: 
  cnode:
    ports:
      - ${PORT}:7001
```
## Deploy

Modify docker-compose.yml

**Run / Stop**

```bash
# start
docker-compose up -d

# stop
docker-compose down

# remove volume/cache
docker-compose down -v
```
