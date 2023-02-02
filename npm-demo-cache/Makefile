build_cached:
	DOCKER_BUILDKIT=1 docker build --progress=plain -t npm-demo:cached .

build_nocached:
	DOCKER_BUILDKIT=1 docker build --progress=plain -f Dockerfile.nocached -t npm-demo:nocached .