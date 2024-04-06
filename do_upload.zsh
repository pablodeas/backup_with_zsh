#!/bin/zsh

# Script Name:    do_upload.sh
# Author:         Pablo Andrade
# Created:        07/12/2023
# Version:        0.2

# Debugging ON / OFF
#set -x

# Variables
script_path="$(dirname "${BASH_SOURCE[0]}")"
source $script_path/config.sh

# Upload
func exec_upload () {
  echo "-> Iniciando Upload"
  rclone copy $bkp_dir $remote:/Backups/ -vv &> $project_dir/upload.log
}

# Execution
if exec_upload; then
  echo "-> Upload executado com Sucesso!"
else
  echo "-> ERRO durante o Upload"
fi
