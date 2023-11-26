#!/bin/zsh

# Onde é salvo os arquivos e o backup compactado
bkp_directory="/backup"

# Pasta que está sendo salva no backup
main_directory='/home/pablodeas'

# Variável com a data de hoje para o nome do arquivo
data=$(date +%d-%m-%y)

# Cria o backup
echo "*** Iniciando Backup ***"
if rsync -av --progress --partial --append --append-verify --exclude='snap' --exclude='Downloads' --exclude='albiononline' --exclude='backup' $main_directory $bkp_directory; then
  echo "*** Backup Criado com Sucesso! ***"

  # Compactando o backup
  echo "*** Iniciando Compactação ***"
  tar -czvf /backup/backup_$data.tar.gz -C $main_directory .
  echo "*** Backup Compactando com Sucesso! ***"

  # Envia o arquivo de log para /backup
  mv /home/pablodeas/Workspace/Projects/pessoal/do_backup/log_backup.txt /backup

else
  echo "*** ERROR, verifique os logs no arquivo: /home/pablodeas/Workspace/Projects/pessoal/do_backup/log_backup.txt ***"
fi
