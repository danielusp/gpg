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

## Symmetric encryption

Encrypts with a simple password

**OBS: AES256 cipher**
### Encrypt a file or a folder

Option 5

### Decrypt a file

Option 6

### Key generation

Generates GPG public and private keys. Backup file into *gpg_keys* folder

Option 9

## Asymmetric encryption

Options 7

*Obs: Need to install a public key*

## Asymmetric decryption

Options 8

*Obs: Need your private key*

## Others

### Show public key

gpg --export --armor

### Backup

gpg --output /output/backupkeys.pgp --armor --export-secret-keys --export-options export-backup

### Restore

gpg --import /output/backupkeys.pgp

docker exec -it gpg-running gpg --import backupkeys.pgp