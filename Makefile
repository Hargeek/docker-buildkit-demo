build_classic:
	docker build -t demo:classic -f simple.Dockerfile .

build_buildkit:
	DOCKER_BUILDKIT=1 docker build -t demo:buildkit -f simple.Dockerfile .