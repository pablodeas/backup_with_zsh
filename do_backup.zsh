#!/bin/zsh

# Onde é salvo os arquivos e o backup compactado
bkp_directory="/backup"

# Pasta que está sendo salva no backup
main_directory='/home/pablodeas/csharp'

# Variável com a data de hoje para o nome do arquivo
data=$(date +%d-%m-%y)

# Variável para verificar a existência do backup compactado
backup_file="$bkp_directory/backup_$data.tar.gz"

# Cria o backup
echo ""
echo ">>> Iniciando Backup <<<"
echo ""
if rsync -av --progress --partial --append --append-verify --exclude='snap' --exclude='Downloads' --exclude='albiononline' --exclude='backup' $main_directory $bkp_directory; then
  echo ""
  echo ">>> Backup Criado com Sucesso! <<<"
  echo ""

  # Compactando o backup (apenas usar o --remove-files se tiver certeza, pois ele apaga os arquivos de origem)
  cd $bkp_directory
  
  echo ""
  echo ">>> Iniciando Compactação <<<"
  echo ""
  tar --remove-files -czvf $backup_file *
  echo ""
  echo ">>> Backup Compactado com Sucesso! <<<"
  echo ""

  # Envia o arquivo de log para /backup
  mv /home/pablodeas/Workspace/Projects/pessoal/do_backup/*.log /backup

else
  echo ""
  echo ">>> ERRO durante o 1° bloco, verifique os logs <<<"
  echo ""
fi

# Enviando o backup para o Google Drive
#if [ -e $backup_file ]; then

#  echo ""
#  echo ">>> Iniciando o upload para o Google Drive <<<"
#  echo ""

#  if gdrive files upload $backup_file; then
#    echo ""
#    echo ">>> Upload concluído com sucesso! <<<"
#    echo ""
  
#  else
#    echo ""
#    echo ">>> ERRO no upload com o Google Drive, verifique os logs <<<"
#    echo ""
#  fi
#
#else
#  echo ""
#  echo ">>> ERRO no 2° bloco, talvez o arquivo não esteja correto, verifique os logs <<<"
#  echo ""
#fi
