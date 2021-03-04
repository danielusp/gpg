run:
	./run.sh

stop:
	docker stop gpg-running

sh:
	docker exec -it gpg-running /bin/bash

list-keys:
	docker exec -it gpg-running gpg --list-keys

version:
	docker exec -it gpg-running gpg --version

genkey:
	docker exec -it gpg-running gpg --full-generate-key
	docker exec -it gpg-running gpg --output /output/backupkeys.pgp --armor --export-secret-keys --export-options export-backup
	mv backupkeys.pgp gpg_keys/
