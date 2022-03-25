.PHONY: default
default: 
	make commit
	make deploy

.PHONY: install
install:
	npm install hexo-cli --save
	npm install

.PHONY: start
start:
	npm run clean
	npm run server

.PHONY: commit
commit:
	git add .
	git commit -m 'update blogs'
	git push origin master

.PHONY: new
new:
	npm run new

.PHONY: deploy
deploy:
	npm run clean
	npm run build
	npm run deploy
	npm run clean