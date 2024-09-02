---
title: 请停止使用for循环
date: 2022-09-13
tags:
    - python
---

## 背景

如果当你面临大量数据的时候，for循环语句会大大降低代码的运行速度，如果是大型上线系统当中，这或许会成为一个灾难。

推荐使用：map、filter、reduce等

如果函数非常简单，尽量使用lambda，不要使用常规的函数定义。


refer to: 
* https://medium.com/codex/3-most-effective-yet-underutilized-functions-in-python-d865ffaca0bb