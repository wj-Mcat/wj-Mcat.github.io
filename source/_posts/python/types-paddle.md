---
title: "types-paddle: 为Paddle增加Tensor类型注释特性"
date: 2022-08-07
tags:
    - python
    - types
---

Paddle中没有Tensor类，导致在IDE中写代码时没有办法进行智能提升，我提供了一个解决方案。

![](/images/2022.07/types-paddle-mini.gif)

<!--more -->

## 思路

* 修改已安装Paddle包的`paddle/tensor/tensor.py`文件，添加未实现的`Tensor`类。
* 添加`tensor.pyi`文件到paddle包当中，从而实现代码智能提示。


## 类型注释的三种结局方案

在python当中有三种方式给代码提供类型注释，从而让IDE能够实现智能提示：

1. 直接在代码中写上类型注释

```python
def add(x: int, y: int) -> int:
    return x + y
```

此方法也是在python3.7+中最为推荐的方式。

2. 原代码中并没有类型注释，便在包中添加`pyi`文件

> 什么是`pyi`文件？可理解为 `python interface`文件，为某个python module提供接口定义信息。

```python
# foo.py
def add(x, y):
    return x + y
```

```python
# foo.pyi
def add(x: int, y: int) -> int: ...
```

此情况下，pyi文件名必须和py文件名一致，这样浏览器在加载原始文件类型信息时，直接从pyi文件中加载。其中[PyGithub](https://github.com/PyGithub/PyGithub)就是使用这种方式来提供类型注释。

3. 作者不想把pyi stub 文件添加到包中

如果每个文件都要添加一个pyi文件，则代码文件数量直接增加一倍，这将会增加维护的难度，于是可将pyi文件通过第三方包发布。 详细原理可阅读[PEP 561 – Distributing and Packaging Type Information](https://peps.python.org/pep-0561/)

## 为什么选择这个解决方案？

### 面临的问题

我最初的做法也是使用第三种方法，可是发现如果用第三方包发布的话，paddle的所有类型提示将会从我的包走：也就是说我要给paddle所有的module都添加上pyi stub 文件。 这工作量很大，而且很多模块都在发生变动，我没有办法及时获取到最新的变动，很容易导致版本接口不兼容的问题。

### 解决方案
于是，我返回使用第二种方法，只是使用`types-paddle`来修改paddle包从而支持类型注释。

## pyi 是如何生成的？

其中最核心的模块属于pyi文件是如何生成的？毕竟这个代表着`Tensor`所有类的所有属性：根据`runtime Tensor`来生成，伪代码如下所示：

```python
import paddle
tensor = paddle.randn([3,4])
members = get_members(tensor)
gen_stub_file_by_tensor_member(members)
```

详细可见：[gen_tensor_stub.py](https://github.com/wj-Mcat/types-paddle/blob/master/scripts/gen_tensor_stub.py)

## 这个包的未来

我相信，未来paddle肯定是会支持类型注释的，毕竟原始`paddle/tensor/tensor.py`文件已经写上了`TODO`。只是该特性还没有完成的时候，这个工具可以提升大家的编码体验。

希望这个工具能够让大家写paddle越来越爽。

## 参考资料

* [introduction of stub file](https://mypy.readthedocs.io/en/stable/getting_started.html#stubs-intro)
* [missing imports in python](https://mypy.readthedocs.io/en/stable/running_mypy.html#fix-missing-imports)
* [install type hints package in python](https://mypy.readthedocs.io/en/stable/installed_packages.html#installed-packages)
* [PEP 561 – Distributing and Packaging Type Information](https://peps.python.org/pep-0561/)