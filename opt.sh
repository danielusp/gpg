#!/bin/bash

########################################
#
#   GPG assistant
#
########################################

if [[ !($(docker ps --filter name=gpg-running -q)) ]]; then
    echo "=================[ WARNING ]======================"
    echo ""
    echo "  GPG is not running on your machine"
    echo "  Select option 1 to start GPG"
    echo ""
    echo "=================================================="
    echo ""
fi

PS3="GPG - Please enter your choice: "
options=("Start GPG" "GPG version" "Import a public key" "List keys" "Symmetric encryption" "Symmetric decryption" "Asymmetric encryption" "Asymmetric decryption" "Generates a Public/Private key" "Stop GPG" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Start GPG")
            ./run.sh
            break
            ;;
        "GPG version")
            docker exec -it gpg-running gpg --version
            break
            ;;
        "Import a public key")
            read -p 'Select the public key: ' pubkey
            docker exec -it gpg-running gpg --import $pubkey
            break
            ;;
        "List keys")
            docker exec -it gpg-running gpg --list-keys
            break
            ;;
        "Symmetric encryption")
            echo "TODO"
            break
            ;;
        "Symmetric decryption")
            echo "TODO"
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
            echo "TODO"
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