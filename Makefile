.PHONY: install
install:
	npm install

.PHONY: start
start:
	hexo server

.PHONY: new
new:
	hexo new

.PHONY: deploy
deploy:
	hexo genearate && hexo deploy