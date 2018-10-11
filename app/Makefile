VERSION=`cat VERSION`

increase-version:
	@expr $(VERSION) + 1 > VERSION

build-image: increase-version
	@docker build -t k8shelloworld:$(file < VERSION) .

run:
	@docker run -P k8shelloworld:$(file < VERSION)

test:
	@docker run k8shelloworld:$(file < VERSION) python test.py
