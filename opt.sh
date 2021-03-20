#!/bin/bash

########################################
#
#   GPG assistant
#
########################################

if [[ !($(docker ps --filter name=gpg-running -q)) ]]; then
    echo "=================[ WARNING ]======================"
    echo ""
    echo "  GPG is not running in your machine"
    echo "  Select option 1 to start GPG"
    echo ""
    echo "=================================================="
    echo ""
fi

PS3="GPG - Please enter your choice: "
options=("Start GPG" "GPG version" "Import a public key" "Import a public/private backup" "List keys" "Symmetric encryption" "Symmetric decryption" "Asymmetric encryption" "Asymmetric decryption" "Generates a Public/Private key" "Enter inside GPG container" "Export GPG public key from a public/private key" "Stop GPG" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Start GPG")
            ./scripts/run.sh
            break
            ;;
        "GPG version")
            docker exec -it gpg-running gpg --version
            break
            ;;
        "Import a public key")
            read -p 'Select the public key file: ' pubkey
            docker exec -it gpg-running gpg --import $pubkey
            break
            ;;
        "Import a public/private backup")
            read -p 'Select the backup file: ' bkfile
            docker exec -it gpg-running gpg --allow-secret-key-import --import $bkfile
            break
            ;;
        "List keys")
            docker exec -it gpg-running gpg --list-keys
            break
            ;;
        "Symmetric encryption")
            read -p 'Select file or folder: ' src
            docker exec -it gpg-running bash /output/scripts/encrypts.sh $src
            break
            ;;
        "Symmetric decryption")
            read -p 'Select a GPG file: ' src
            docker exec -it gpg-running bash /output/scripts/decrypts.sh $src
            break
            ;;
        "Asymmetric encryption")
            read -p 'Select a public key (type the e-mail): ' pkemail
            read -p 'Select a file to encrypt: ' file
            docker exec -it gpg-running gpg --encrypt --recipient $pkemail $file
            break
            ;;
        "Asymmetric decryption")
            read -p 'Select a file to decrypt: ' file
            read -p 'Select an output file name: ' outputfile
            docker exec -it gpg-running gpg --output $outputfile --decrypt $file
            break
            ;;
        "Generates a Public/Private key")
            read -p 'Select a name for GPG pub/priv file [backupkeys]: ' gpgbackupname
            gpgbackupname=${gpgbackupname:-backupkeys}
            ./scripts/genkey.sh $gpgbackupname
            break
            ;;
        "Enter inside GPG container")
            docker exec -it gpg-running /bin/bash
            break
            ;;
        "Export GPG public key from a public/private key")
            read -p 'Select a public/private key (type the e-mail): ' pkemail
            read -p 'Select an output file name: ' outputfile
            docker exec -it gpg-running gpg --output gpg_keys/$outputfile.pen --armor --export $pkemail
            break
            ;;
        "Stop GPG")
            docker stop gpg-running
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done