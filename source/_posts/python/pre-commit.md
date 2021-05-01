---
title: pre-commit 工具
date: 2021-04-29 20:32:58
tags:
    - python
---

现在DevOps已然成为项目当中一个常用方式，相信大家都有所涉猎，其中大部分都是基于Git项目管理来进行项目的协作，所以这个时候如何保证你所写的每一行代码都符合社区和公司规范，pre-commit工具能够帮助你更好的完成这个工作。

pre-commit主要是为了完成git项目拉取和提交的过程中完成自定义的一些代码审查、日志记录、自动更新版本号等常见功能，当然也可以参与CD流程中的开发。那今天我就要来介绍pre-commit在实际使用过程中的小技巧。

<!--more -->

## 一、快速上手

### 1.1 安装工具

```shell
pip install pre-commit
```

> 别看是使用python来安装工具，可是在任何编程语言上都是通用的。

安装完成之后即可查看对应工具的版本：

```shell
$ pre-commit --version
pre-commit 2.12.1
```

### 1.2 安装hook脚本

hook是什么？hook原意钩子，是在git提交之前，提交之后执行的脚本，能够进行代码审查，撤销提交操作等，也是这个工具的核心脚本。

安装的脚本如下所示：

```shell
pre-commit install
```

### 1.3 配置文件

当开发者在push代码之前，需要对进行审查，或者push成功之后，在自动更新项目版本文件（VERSION），此类定制化的任务是需要通过配置文件来完成。

配置文件能够在不同分支和git操作阶段执行自定义任务脚本，完成自定义的代码审查。添加配置文件有多种方式：

* 手动添加一个文件：`.pre-commit-config.yaml`
* 通过命令行创建一个模板配置文件：`pre-commit sample-config`

设定一个场景，要在项目本地代码提交之前进行代码审查，其配置文件如下所示：

```yaml
# the hook execution directory in under git root directory
repos:
- repo: local
  hooks:

  - id: pylint
    name: pylint
    description: "Pylint: Checks for errors in Python code"
    language: python
    entry: pylint ./src
    always_run: true
    verbose: true
    require_serial: false
    stages: [push]
    types: [text]
```

### 1.4 参数说明

* repos
    通过属性名即可得知，此配置文件可对多个repo配置hook，在上述配置当中我只对本地单个repo进行了配置。

    注意，其中的repo名为：local。

* hooks
    在每个项目当中，可以配置多个hooks任务，从而实现定制化的操作。同样，hooks也是一个列表属性。

* id/name/description/language/
    此类属性是单个hook任务的描述信息。

* entry
    这个就是该hook任务的自定义Bash脚本，大家可以在此处编写逻辑较为复杂的代码审查，也可以将复杂的脚本通过外部脚本文件来执行。这部分就是通过程序员自行扩展。

* verbose
    是否在控制台中打印日志记录，这个通常会设置成True。

* require_serial
    是否在一个进程当中执行该任务：通常情况下不同任务都是隔离的，没有依赖关系，如果审查的耗时较长，则可以设置为`False`加快其执行的速度。

* stages
    当代码在提交时，会触发`commit`、`commit`,`merge-commit`, `push`, `prepare-commit-msg`, `commit-msg`, `post-checkout`, `post-commit`, `post-merge`, or `manual`，通常情况下使用`push`即可。

* types
    pre-commit 工具会在不同类型的文件上制定对应的文件，
