#!/bin/zsh

# Script Name:    do_upload.sh
# Author:         Pablo Andrade
# Created:        07/12/2023
# Version:        0.1

# Debugging ON / OFF
#set -x

# Diretório de backup
backup_dir="/backup"

if [ -e $backup_dir ];then

  if gdrive files upload --recursive $backup_dir;then

    echo "
    >>> Upload com sucesso! <<<
    "
  else
    echo "
    >>> ERRO no upload <<<
    "
  fi

else
  echo "
  >>> ERRO na verificação do diretório de backup <<<
  "
fi
