FROM registry.cn-beijing.aliyuncs.com/common-node/alpine:14.4 as builder

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update \
    && apk add --no-cache git nodejs npm python3 make g++ \
    && rm -rf /var/cache/apk/* 

WORKDIR /easy-monitor

RUN git clone https://github.com/X-Profiler/xprofiler-console.git
RUN git clone https://github.com/X-Profiler/xtransit-manager.git
RUN git clone https://github.com/X-Profiler/xtransit-server.git

RUN cd ./xprofiler-console && npm install \
    && cd ../xtransit-manager && npm install \
    && cd ../xtransit-server && npm install

FROM registry.cn-beijing.aliyuncs.com/common-node/alpine:14.4

WORKDIR /easy-monitor

COPY --from=builder /easy-monitor .
COPY . .

RUN cat xprofiler-console.config.js > xprofiler-console/config/config.default.js
RUN cat xtransit-manager.config.js > xtransit-manager/config/config.default.js
RUN cat xtransit-server.config.js > xtransit-server/config/config.default.js

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update \
    && apk add --no-cache bash nodejs npm nginx tzdata mysql redis \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk del tzdata \
    && rm -rf /var/cache/apk/* \
    && cp mysql/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf \
    && chmod +x ./mysql/startup.sh \
    && chmod +x ./start.sh \
    && mkdir -p /run/nginx \
    && cp -rf ./nginx/default.conf /etc/nginx/conf.d/default.conf

CMD ./start.sh