#!/bin/zsh

# Onde é salvo os arquivos e o backup compactado
bkp_directory="/backup"

# Pasta que está sendo salva no backup
main_directory='/home/pablodeas/'

# Variável com a data de hoje para o nome do arquivo
data=$(date +%d-%m-%y)

# Variável para verificar a existência do backup compactado
backup_file="$bkp_directory/backup_$data.tar.gz"

# Cria o backup
echo ""
echo ">>> Iniciando Backup <<<"
echo ""
if rsync -av --progress --partial --append --append-verify --exclude='snap' --exclude='powerlevel10k' --exclude='albiononline' --exclude='backup' $main_directory $bkp_directory; then
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
  echo ">>> ERRO, verifique os logs <<<"
  echo ""
fi
