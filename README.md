# Project Title: Automated Backup System

This project consists of two main files: `config.sh` and `backup.zsh`. These scripts are designed to automate the process of backing up and compressing data from a specified directory to another directory.

## config.sh
This is a configuration file that sets up environment variables for the backup process. It includes:

- `data`: The current date formatted as DD-MM-YY.
- `main_dir`: The directory to be backed up.
- `bkp_dir`: The directory where the backup will be stored.
- `bkp_file`: The name of the backup file.

## backup.zsh
This script performs the backup and compression operations. It includes:

- `exec_bkp()`: This function initiates the backup process using the `rsync` command. The `-a` flag enables archive mode, preserving symbolic links, file permissions, and other attributes. The `--progress` flag displays progress during the transfer. The `--partial` flag keeps partially transferred files, and `--append-verify` verifies the append operation. The source directory (`main_dir`) is backed up to the destination directory (`bkp_dir`), and the progress is logged in a file named after the current date in the backup directory [1].

- `exec_compact()`: This function initiates the compression of the backup directory. It uses the `tar` command with the `--remove-files` flag, which removes files after they are added to the archive. The `-c` flag creates a new archive, `-z` compresses the archive using gzip, `-v` verbosely lists the files processed, and `-f` specifies the archive file name [3].

The script checks the success of the backup and compression processes, printing relevant messages. If any process fails, an error message is printed.

## How to Use
First, ensure that the `config.sh` and `backup.zsh` files have execute permissions. You can add execute permissions using the command `chmod +x filename`.

Then, run the `backup.zsh` script. If successful, a backup of the `main_dir` will be created in the `bkp_dir`, and the backup will be compressed into a `.tar.gz` file.

Remember to replace the directories in the `config.sh` file with your actual directories before running the script.

Please note that these scripts are intended for use in a Unix-like environment where tools like `rsync` and `tar` are available.
