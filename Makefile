.DEFAULT_GOAL := deploy


.PHONY: default
default: 
	make commit
	make deploy

.PHONY: install
install:
	npm i hexo-theme-next
	cd theme && git clone https://github.com/blinkfox/hexo-theme-matery && cd ..
	cnpm install hexo-cli --save
	cnpm install
	npm i --save hexo-wordcount
	npm i -g rimraf

.PHONY: start
start:
	cnpm run clean
	cnpm run server

.PHONY: commit
commit:
	git add .
	git commit -m 'update blogs'
	git push origin master

.PHONY: new
new:
	cnpm run new

.PHONY: deploy
deploy:
	cnpm run clean
	cnpm run build
	cnpm run deploy
	cnpm run clean
	curl -H 'Content-Type:text/plain' --data-binary @urls.txt "http://data.zz.baidu.com/urls?site=https://wj-mcat.github.io&token=JBLByPkviUnoScwr"