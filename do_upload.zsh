#!/bin/zsh

# Script Name:    	do_upload.sh
# Author:         	Pablo Andrade
# Created:			07/12/2023
# Change:			07/11/2024 [ New function, policy_remove ]
# Version:        	0.3

#set -x [ For Debbug Mode, decomment this line and remove this comment.]

project_directory="/home/pablodeas/Projects/pessoal/do_backup"
source "$project_directory/config.sh"

# Remove Old
func policy_remove () {
	echo "---"
	echo "-> Removing Backup from 3 Days..."
	echo "---"
	rclone deletefile $remote:/Backups/$bkp_remote_delete -vv
	
	if [ $? -eq 0 ]; then
		echo $msg_sucess
	else
		echo $msg_error
	fi
}

# Upload
func exec_upload () {
	echo "---"
	echo "-> Starting Upload..."
	echo "---"
	rclone copy $bkp_dir $remote:/Backups/ -vv

	if [ $? -eq 0 ]; then
		echo $msg_sucess
	else
		echo $msg_error
	fi
}

# Execution
policy_remove &> $project_log/rclone_$data.log
exec_upload &>> $project_log/rclone_$data.log
