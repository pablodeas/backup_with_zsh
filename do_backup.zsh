#!/bin/zsh

# Script Name:  backup.zsh
# Author:       Pablo Andrade
# Created:      28/11/2023
# Version:      1.2

# To decompress
#tar -xzvf $bkp_file

# Debugging ON/OFF
#set -x

# Variables
script_path="$(dirname "${BASH_SOURCE[0]}")"
source $script_path/config.sh

# Remove Last Backup File
function remove_last () {
	echo " --- "
	echo "-> Removing last Backup File!..."
	echo " --- "
	rm -f $bkp_last
	
	if [ $? -eq 0 ]; then
		echo $msg_sucess
	else
		echo $msg_error
	fi
}

# Backup
function exec_bkp () {
	echo " --- "
	echo "-> Starting Backup..."
	echo " --- "
	rsync -av --progress --partial --append-verify $main_dir $bkp_dir &> $project_log/rsync_$data.log

	if [ $? -eq 0 ]; then
		echo $msg_sucess
	else
		echo $msg_error
	fi
}

# Compress
function exec_compact () {
    echo " --- "
    echo "-> Starting Compression..."
    echo " --- "
    # Redireciona a saída de erro para um arquivo temporário
    tar --remove-files -czvf $bkp_file * &> $project_log/tar_$data.log

    # Verifica se a mensagem de alerta está presente no arquivo de log
    if grep -q "File shrank by" $project_log/tar_$data.log; then
        echo "-> Alert: The file was compressed Successfully, but there was an alert."
        # Aqui você pode adicionar ações específicas para tratar o alerta
    elif [ $? -eq 0 ]; then
        echo $msg_sucess
    else
        echo $msg_error
    fi
}


# Execution
#1
remove_last

#2
exec_bkp

cd $bkp_dir

#3
exec_compact
