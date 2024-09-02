---
title: Cuda 入门 
tags:
  - cpp
  - cuda 
categories:
  - nlp
  - knowledge
author: wj-Mcat
date: 2022-07-23
---

## Introduction

## Grid & Block & Thread

* Thread: 一个cuda函数会被多个线程执行，故在函数体内需要进行·
* block: 数个thread会被群组成一个block，同一个block中的thread可以同步，也可以通过shared memory进行通信。
* grid: 多个block则会再构成grid。

## CUDA 编程模型

CUDA 程序执行顺序如下所示：

* 分配host内存，并进行数据初始化；
* 分配device内存，并从host将数据拷贝到device上；
* 调用CUDA的核函数在device上完成指定的运算；
* 将device上的运算结果拷贝到host上；
* 释放device和host上分配的内存。


kernel: 在CUDA 线程傻姑娘执行的函数，通常代码是需要写在`.cu`文件中。核函数使用舍`__global__`符号声明，在调用时需要指定<<<grid, block>>>来指定kernel需要执行的线程数量。

在cuda中，每一个线程都是需要执行核函数，并会被分配唯一一个threadid，通过核函数的内置变量`threadIdx`来获取。

函数类型限定词：

* `__global__`: 在device上执行，在host中调用（一些特定的GPU也可以从device中调用），返回数据类型必须void，不支持可变参数，不能成为类函数成员。

    此类函数是异步的，故不会等到kernel执行完再执行下一步。

* `__device__`: 在device上执行，仅能在device中调用此函数，不可以和`__global__`同时使用。

* `__host__`: 仅再host上执行和调用，一般省略不写。


一个kernel启动的所有线程表示为一个Grid, 同一个Grid中的所有线程是共享全局内存空间，其中又包含多个Block（县城块），在调用时可指定grid和block来指定kernel使用的线程数。

![images/2022.07/cuda-grid.png]

一个线程块的线程是放在同一个流式多处理器（Stream Multi-Processor），其拥有数百个并发处理的计算的资源，其一定程度上决定GPU的计算能力。Grid只是一个逻辑层，映射线程管理的层面，而SM才是设计到硬件层面的东西。

SM采用的是SIMT（single-instruction Multi-Thread），单指令多线程的架构，基本的执行单元是线程束（wraps），

Block中某一个线程的ID可表示为：x + y * D_x。


在实际项目过程中，host和device的内存分布很容易出现问题，所以cuda6.0提出了统一内存分配：Unified Memory

问题：
怎么确定grid和block的维度大小呢？

