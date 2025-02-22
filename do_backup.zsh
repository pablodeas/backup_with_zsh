#!/usr/bin/env zsh

# Script Name:      backup.zsh
# Author:           Pablo Andrade
# Created:          28/11/2023
# Last Alteration:  22/02/2025
# Version:          1.4 [ exec_bkp adjusted. ]

#tar -xzvf $bkp_file [ To decompress ]
#set -x [ For Debbug Mode, decomment this line and remove this comment.]

# Variables
project_directory="/home/pablodeas/Projects/pessoal/do_backup"
source "$project_directory/config.sh"

# Remove Last Backup File
function remove_last () {
	echo " --- "
	echo "-> Removing last Backup File!..."
	echo " --- "
	find $bkp_last -type f -exec rm {} +
	
	if [ $? -eq 0 ]; then
		echo $msg_sucess
	else
		echo $msg_error
	fi
}

# Remove Last Log Files
function remove_logs () {
  echo " --- "
  echo "-> Removing following Log files..."
  echo " --- "
  find $project_log -type f -mtime +2 -ls
  find $project_log -type f -mtime +2 -delete

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
	rsync -av --partial --append-verify $1 $2

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
    tar --remove-files -czvf $bkp_file *

    if [ $? -eq 0 ]; then
      echo $msg_sucess
    else
      echo $msg_error
    fi
}

# Execution

remove_logs &> $project_log/remove_logs_$data.log
exec_bkp $main_dir $bkp_dir &> $project_log/rsync_$data.log
exec_bkp $document_dir $bkp_dir &>> $project_log/rsync_$data.log
cd $bkp_dir
exec_compact &> $project_log/tar_$data.log