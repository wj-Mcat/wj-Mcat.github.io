---
title: type hint in python
date: 2022-08-06
tags:
    - python
    - types
---

类型注释可提升代码的阅读性，配合工具可分析代码中潜藏的Bug，在Python3.7 + 中依然支持变量类型注释，在此我也推荐大家尽量多写一些类型注释，提升代码的可读性和质量。

## 类型注释

### 什么是类型注释？



### 优点

* 不影响运行性能
* 配合类似于pylint、mypy等工具可分析出代码中潜藏的Bug。

## py.typed

编译器通常不会去做类型推断，特别是安装的第三方库，除非滴

## types-<distribution>

## 参考资料

* [introduction of stub file](https://mypy.readthedocs.io/en/stable/getting_started.html#stubs-intro)
* [missing imports in python](https://mypy.readthedocs.io/en/stable/running_mypy.html#fix-missing-imports)
* [install type hints package in python](https://mypy.readthedocs.io/en/stable/installed_packages.html#installed-packages)