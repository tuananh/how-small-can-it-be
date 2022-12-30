native-image-pkg:
	melange build native-image.melange.yaml --signing-key melange.rsa --arch amd64

tiny-java-app-pkg:
	melange build tiny-java-app.melange.yaml --signing-key melange.rsa --keyring-append melange.rsa.pub --source-dir ./src --arch amd64 

container-image:
	apko build apko.yaml tiny-java-app:latest tiny-java-app.tar --debug --keyring-append melange.rsa.pub
	
dev-container:
	docker run --privileged --rm -it -v "${PWD}:${PWD}" -w "${PWD}" cgr.dev/chainguard/sdk:latest