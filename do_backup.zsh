#!/bin/zsh

# Script Name:    do_backup.sh
# Author:         Pablo Andrade
# Created:        28/11/2023
# Version:        0.5

# Debugging ON / OFF
#set -x

# Diretório de Backup
bkp_directory="/backup"
# Diretório de Origem
main_directory='/home/pablodeas'
# Data atual
data=$(date +%d-%m-%y)
# Variável nome backup
backup_file="$bkp_directory/backup_$data.tar.gz"


echo "
>>> Iniciando Backup <<<
"
# Cria o backup
if rsync -av --progress --partial --append --append-verify --exclude='snap' --exclude='powerlevel10k' --exclude='albiononline' --exclude='backup' $main_directory $bkp_directory; then
  echo "
  >>> Backup Criado com Sucesso! <<<
  "
else
  echo "
  >>> ERRO durante a criação do backup <<<
  "
fi


# Muda para o diretório de backup
cd $bkp_directory


echo "
>>> Iniciando Compactação <<<
"
# Compactando o backup (apenas usar o --remove-files se tiver certeza, pois ele apaga os arquivos de origem)
if tar --remove-files -czvf $backup_file *;then

  # Envia o arquivo de log para /backup
  mv /home/pablodeas/Workspace/Projects/pessoal/do_backup/*.log /backup

  echo "
  >>> Backup Compactado com Sucesso! <<<
  "
else
  echo "
  >>> ERRO durante a compactação. <<<
  "
fi


# Colocado em um script diferente

#echo "
#>>> Iniciando Upload do Backup <<<
#"
## Enviando o backup para o Google Drive
#if [ -e $backup_file ];then
#
#  if gdrive files upload $backup_file; then
#  echo "
#  >>> Upload Concluído com Sucesso! <<<
#  "
#  else
#    echo "
#    >>> ERRO durante Upload <<<
#    "
#  fi
#
#else
#  echo "
#  >>> ERRO durante Upload <<<
#  "
#fi
