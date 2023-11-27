#!/bin/zsh

# Onde é salvo os arquivos e o backup compactado
bkp_directory="/backup"

# Pasta que está sendo salva no backup
main_directory='/home/pablodeas'

# Variável com a data de hoje para o nome do arquivo
data=$(date +%d-%m-%y)

# Variável para verificar a existência do backup compactado
backup_file="$bkp_directory/backup_$data.tar.gz"

# Cria o backup
echo ">>> Iniciando Backup <<<"
if rsync -av --progress --partial --append --append-verify --exclude='snap' --exclude='Downloads' --exclude='albiononline' --exclude='backup' $main_directory $bkp_directory; then
  echo ">>> Backup Criado com Sucesso! <<<"

  # Compactando o backup (apenas usar o --remove-files se tiver certeza, pois ele apaga os arquivos de origem)
  cd $bkp_directory
  
  echo ">>> Iniciando Compactação <<<"
  tar -czvf $backup_file * .
  echo ">>> Backup Compactando com Sucesso! <<<"

  # Envia o arquivo de log para /backup
  mv /home/pablodeas/Workspace/Projects/pessoal/do_backup/*.log /backup

else
  echo ">>> ERROR, verifique os logs <<<"
fi

# Enviando o backup para o Google Drive
if [ -e $backup_file ]; then

  echo ">>> Iniciando o upload para o Google Drive <<<"

  if gdrive files upload $backup_file; then
    echo ">>> Upload concluído com sucesso! <<<"
  
  else
    echo ">>> ERROR, verifique os logs <<<"
  fi

else
  echo ">>> ERROR, verifique os logs <<<"
fi
