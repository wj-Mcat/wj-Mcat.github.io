.PHONY: default
default: 
	make commit
	make deploy

.PHONY: install
install:
	cnpm install hexo-cli --save
	cnpm install

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