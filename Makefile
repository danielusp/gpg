assistant:
	./opt.sh
run:
	./run.sh

genkey:
	docker exec -it gpg-running gpg --full-generate-key
	docker exec -it gpg-running gpg --output /output/backupkeys.pgp --armor --export-secret-keys --export-options export-backup
	mv backupkeys.pgp gpg_keys/
