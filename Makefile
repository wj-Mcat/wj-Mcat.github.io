.PHONY: install
install:
	npm install hexo-cli --save
	npm install

.PHONY: start
start:
	npm run clean
	npm run server

.PHONY: new
new:
	npm run new

.PHONY: deploy
deploy:
	npm run clean
	npm run build
	npm run deploy
