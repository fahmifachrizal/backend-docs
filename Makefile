
.PHONY: help install serve build clean deploy serve-firebase

help:
	@echo "Available commands:"
	@echo "  make install          Install MkDocs and dependencies"
	@echo "  make serve            Run MkDocs dev server"
	@echo "  make build            Build static site"
	@echo "  make deploy           Build and deploy to Firebase Hosting"
	@echo "  make serve-firebase   Serve locally and deploy to Firebase"
	@echo "  make clean            Remove generated site"

install:
	pip install --upgrade pip
	pip install mkdocs mkdocs-material mkdocs-material pymdown-extensions

serve:
	mkdocs serve

build:
	mkdocs build

deploy: build
	firebase deploy --only hosting

serve-firebase: build
	firebase deploy --only hosting
	mkdocs serve

clean:
	rm -rf site
