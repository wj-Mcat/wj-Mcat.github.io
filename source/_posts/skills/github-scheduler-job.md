---
title: Github任务调度任务
date: 2022-11-07
tags:
    * stock
---

当你有一些想要定时执行的、内容可放到github上的一些任务，可使用Github的任务调度workflow来（白嫖）完成这个功能。

<!--more-->

## 背景

我需要每日定期爬取国内某些股票的信息，于是便写了一个脚本让它每天早上自动化爬取并将文件自动化提交到github repo当中，从而实现：自动爬取并存储。

## 实现

* 新建一个repo

这个就不需要我亲自演示了吧。

* 编写爬取股票信息的脚本

推荐使用tushare来爬去对应的数据，最终存储成文件。

* 添加workflow文件

> 关于如何如何添加Github Workflow可阅读[Github Actions](https://github.com/features/actions)。

```yml
name: Daily job
on:
  schedule:
    # 每天凌晨执行任务
    - cron: "0 0 * * *"

jobs:
  report:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Create & Save report file
        # 运行自定义脚本
        run: |
          pip install -r requirements.txt
          python scripts/fetch_stocks.py
          git config --global user.name 'your-name'
          git config --global user.email 'your-email'
          git pull origin main
          git add .
          git commit -am "Auto Update stock data"
          git push
```


通过以上配置即可实现自动化数据抓取。

## 总结

Github 提供了很多可以白嫖的东西，同时也增加了对其的依赖性。

But anyway，这对于双方都是一件好事。
