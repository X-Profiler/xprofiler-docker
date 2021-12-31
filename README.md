# xprofiler-docker

## 一、通过 docker-compose 快速启动 xprofiler

**1. 克隆**

```bash
git clone https://github.com/X-Profiler/xprofiler-docker.git
```

**2. 修改配置**

修改 docker-compose.yml 文件中的配置信息， 部署到服务器时主要修改 `XPROFILER_CONSOLE_URL` 为服务器地址，本地运行默认即可， 其他的根据自己需要修改配置

**3. 启动 / 停止**

```bash
cd xprofiler-docker

# start
docker-compose up -d

# stop
docker-compose down
```

**4. 访问**

浏览 http://127.0.0.1:8443 即可看到控制台。

## 二、单容器部署方案

**1. 克隆**

```bash
git clone https://github.com/X-Profiler/xprofiler-docker.git
```

**2. 镜像**

```bash
docker build -t easy-monitor .
```
**3. 启动**

```bash
docker run -itd --name easy-monitor -p 80:80 -e XPROFILER_CONSOLE_URL=http://127.0.0.1 easy-monitor
```

1. 如果需要挂载数据库数据到宿主机，容器数据库数据在 `/easy-monitor/mysql/data` 目录，如 `-v ~/mysql/data:/easy-monitor/mysql/data`

2. `XPROFILER_CONSOLE_URL` 为上传文件服务器地址

3. 可以设置 MySQL 初始 root 密码，`-e MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD`

4. `ws://127.0.0.1/chat` 为 `xtransit` 连接地址

**4. 访问**

浏览 http://127.0.0.1 即可看到控制台。