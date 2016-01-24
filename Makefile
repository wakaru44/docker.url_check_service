help:
	@echo "install      - Clone the repo of the app for docker to build"
	@echo "build-local  - Build container for local development"
	@echo "build-deploy - Build container in production mode"
	@echo "run-local    - Run container for local development"
	@echo "run-deploy   - Run container for in production mode"

install:
	cd app; git clone https://github.com/wakaru44/url_check_service.git app

build-base:
	cd ops/base/; docker build -t="wakaru44/python-base" .

build-local: build-base
	cd ops/local/; docker build -t="wakaru44/python-local" .

build-deploy: build-base
	cd ops/deploy/; docker build -t="wakaru44/python-deploy" .

run-local: build-local
	docker run -P -t -i -v $(CURDIR)/app:/opt/app wakaru44/python-local

run-deploy: build-deploy
	docker run -P -t -i -v $(CURDIR)/app:/opt/app wakaru44/python-deploy
