build:
	docker build -t gpg .

sh:
	docker run -it --rm -v ${PWD}:/output gpg /bin/bash

list-keys:
	docker run -it --rm -v ${PWD}:/output gpg gpg --list-keys