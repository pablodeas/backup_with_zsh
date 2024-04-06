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
  echo "-> Starting Upload..."
  rclone copy $bkp_dir $remote:/Backups/ -vv &> $project_log/rclone_$data.log

	if [ $? -eq 0 ]; then
		echo $msg_sucess
	else
		echo $msg_error
	fi
}

# Execution
exec_upload