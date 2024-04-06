#!/bin/zsh

# Script Name:  backup.zsh
# Author:       Pablo Andrade
# Created:      28/11/2023
# Version:      1.1

# To decompress
#tar -xzvf $bkp_file

# Debugging ON/OFF
#set -x

# Variables
script_path="$(dirname "${BASH_SOURCE[0]}")"
source $script_path/config.sh

# Remove Last Backup File
function remove_last () {
	echo "-> Apagando o último arquivo para iniciar o Backup!"
	rm -rf $bkp_last &> $project_dir/remove_last.log
}

# Backup
function exec_bkp () {
        echo "-> Iniciando Backup..."
        rsync -av --progress --partial --append-verify $main_dir $bkp_dir > $bkp_dir/rsync_$data.log
}

# Compress
function exec_compact () {
        echo "-> Iniciando compactação..."
        tar --remove-files -czvf $bkp_file *
}

# Execution
if remove_last; then
	echo "-> Último arquivo apagado com sucesso!"
else
	echo "-> ERRO ao apagar último arquivo."
fi

if exec_bkp; then
        echo "-> Backup executado com Sucesso!"
else
        echo "-> ERRO durante o backup."
fi

cd $bkp_dir

if exec_compact; then
        echo "-> Compactado com sucesso!"
else
        echo "-> ERRO durante a compactação."
fi
