---
title: 基于Docker和Nginx在一台机器上部署多个网站
date: 2022-09-22
tags:
    - python
---

## 介绍

如果你有一台机器，并且想要部署多个网站，基于Docker就可以完成此功能。

假设你服务器的80端口绑定的域名是：www.website.com，同时还绑定了其他子域名到该服务器上，比如：`first.website.com`，`second.website.com`等，Nginx Docker服务会监听80端口，同时会有来自于不同域名的请求，此时可使用nginx可针对于不同域名做不同的转发，比如接受到：`first.website.com`就将其转发到`website.com:81`，接受到`second.website.com`就转发到`website.com:81`端口上，这样就可以实现一台服务器解析多个域名，并且能够正常工作。

Nginx很擅长做以上的事情，而这个过程称之为：反向代理（reverse proxy）。同时配合Docker中的`VIRTUAL_HOST`变量可以很巧妙的完成这个工作。

## 实现

### 使用Nginx Docker实现代理

首先需要创建一个docker网络，实现方式有两种：

* docker 命令

```shell
docker network create nginx-proxy
```

* docker-compose

```yml
version: "3"
services:
  nginx-proxy:
    image: jwilder/nginx-proxy
    container_name: nginx-proxy
    ports:
      - "80:80"
    volumes:
      - /var/run/docker.sock:/tmp/docker.sock:ro

networks:
  default:
    external:
      name: nginx-proxy
```

## 参考链接

* [Host Multiple Websites On One VPS With Docker And Nginx](https://blog.ssdnodes.com/blog/host-multiple-websites-docker-nginx/)
* [Chatie/server](https://github.com/Chatie/server)
