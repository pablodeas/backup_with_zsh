#!/usr/bin/env zsh

# Script Name:  backup.zsh
# Author:       Pablo Andrade
# Created:      28/11/2023
# Version:      1.2

# To decompress
#tar -xzvf $bkp_file

# Debugging ON/OFF
#set -x

#script_path="$(dirname "${BASH_SOURCE[0]}")"

# Variables
project_directory="/home/pablodeas/Projects/pessoal/do_backup"
source "$project_directory/config.sh"

# Remove Last Backup File
function remove_last () {
	echo " --- "
	echo "-> Removing last Backup File!..."
	echo " --- "
	/usr/bin/rm -f $bkp_last
	
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
    tar --remove-files -czvf $bkp_file * &> $project_log/tar_$data.log

    if grep -q "File shrank by" $project_log/tar_$data.log; then
        echo "-> Alert: The file was compressed Successfully, but there was an alert."
    elif [ $? -eq 0 ]; then
        echo $msg_sucess
    else
        echo $msg_error
    fi
}

# Execution

#remove_last

remove_logs

exec_bkp

cd $bkp_dir

exec_compact
