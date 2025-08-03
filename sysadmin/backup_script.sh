#!/bin/bash

function ctrl_c(){
  echo -e "\n\n [!] Saliendo...\n"
  exit 1
}

#ctrl_c
trap ctrl_c SIGINT

#Verify use an argument
if [ -z "$1" ]; then
  echo "Uso: $0 <carpeta_a_respaldar>"
  exit 1
fi

#->Defining variables<-
BACKUP_SRC="$1"
#Define destiny 
BACKUP_DST="/home/kali/Documents/backups"
#Define date 
BACKUP_DATE=$(date +%Y%m%d%H%M%S)
#Define backup name
BACKUP_FILENAME="backup_$BACKUP_DATE.tar.gz"

#Creating the directory where saved the backup 
mkdir -p "$BACKUP_DST/$BACKUP_DATE"

#Archive the source directory
tar -czf "$BACKUP_DST/$BACKUP_DATE/$BACKUP_FILENAME" "$BACKUP_SRC"

#Verify the backuo was created successfully

# $? -> Save the last line / -eq 0 -> Exit code was successfully if is another exit code, its an error 
if [ $? -eq 0 ]; then
  echo "Backup successful: $BACKUP_FILENAME"
else 
  echo "Backup failed"
fi
