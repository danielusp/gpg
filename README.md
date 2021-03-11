# GPG

Encrypts/decrypts files/folders with GPG 

## Your secure keys

The *gpg_keys* folder is your secure key home

When you generate a new GPG or import a previous GPG key this is the place where to put it. Name your GPG file as *backupkeys.pgp*

## Assistant

For an easyest use o GPG run GPG Assistant

```bash
make assistant
```

## Build and run 

```bash
make run
```
## Symmetric encryption

Encrypts with a simple password

**OBS: AES256 cipher**
### Encrypt a file or a folder

```bash
./e.sh [file | folder] [filename]
```

### Decrypt a file

```bash
./d.sh [file].gpg
```

### Key generation

Generates GPG public and private keys

```bash
make genkey
```

## Asymmetric encryption and decryption

```bash
docker exec -it gpg-running gpg --encrypt --recipient soueu@soueu teste.txt

docker exec -it gpg-running gpg --output teste-desc.txt --decrypt teste.txt.gpg
```

## Export public key

```bash
docker exec -it gpg-running gpg --export --armor --output key2.pen
```

## Import public key

```bash
docker exec -it gpg-running gpg --import key.pen
```

## Others

### Start container and keep it running

docker run -d -it --rm --name gpg-running -v ${PWD}:/output gpg /bin/bash

### Run a GPG command into container

docker exec -it gpg-running gpg --version

### Enter inside running container

docker exec -it gpg-running /bin/bash

### Show public key

gpg --export --armor

### Backup

gpg --output /output/backupkeys.pgp --armor --export-secret-keys --export-options export-backup

### Restore

gpg --import /output/backupkeys.pgp

docker exec -it gpg-running gpg --import backupkeys.pgp