#!/usr/bin/env zsh

# Script Name:  backup.zsh
# Author:       Pablo Andrade
# Created:      28/11/2023
# Version:      1.3 [ remove_last fixed. ]

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
  echo "-> Removing last Log files..."
  echo " --- "
  find $project_log -type f -newermt $data -exec rm {} +

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
	rsync -av --partial --append-verify $main_dir $bkp_dir

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

#remove_last
remove_logs
exec_bkp &> $project_log/rsync_$data.log
cd $bkp_dir
exec_compact &> $project_log/tar_$data.log