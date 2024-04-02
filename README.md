# Backup and Upload Scripts

This repository contains scripts for automating the backup and upload process of a specified directory. The scripts are written in Zsh and Bash, and they rely on external tools like `rsync`, `tar`, and `rclone` for their operations.

## Table of Contents

- [Backup Script](#backup-script)
- [Upload Script](#upload-script)
- [Configuration](#configuration)
- [Usage](#usage)
- [Dependencies](#dependencies)

## Backup Script

### `do_backup.zsh`

This script is responsible for creating a backup of a specified directory. It uses `rsync` to synchronize files from the source directory to the backup directory and then compresses the backup directory into a `.tar.gz` file.

#### Key Features:

- **Backup**: Uses `rsync` to create a backup of the specified directory.
- **Compression**: Compresses the backup directory into a `.tar.gz` file.
- **Logging**: Logs the backup process to a file.

#### Usage:

1. Ensure the `config.sh` file is correctly set up with the source and backup directory paths.
2. Make the script executable: `chmod +x do_backup.zsh`
3. Run the script: `./do_backup.zsh`

## Upload Script

### `do_upload.zsh`

This script uploads the backup file to a remote storage location using `rclone`. It's designed to work with any remote storage supported by `rclone`.

#### Key Features:

- **Upload**: Uses `rclone` to upload the backup file to a remote storage location.
- **Logging**: Logs the upload process.

#### Usage:

1. Ensure the `config.sh` file is correctly set up with the remote storage configuration.
2. Make the script executable: `chmod +x do_upload.zsh`
3. Run the script: `./do_upload.zsh`

## Configuration

### `config.sh`

This file contains the configuration for both the backup and upload scripts. It defines variables such as the source directory, backup directory, backup file name, remote storage configuration, and more.

#### Key Variables:

- `data`: The current date in `dd-mm-yy` format.
- `main_dir`: The source directory to be backed up.
- `bkp_dir`: The directory where the backup will be stored.
- `bkp_file`: The name of the backup file.
- `bkp_last`: The pattern to match the last backup file for deletion.
- `remote`: The name of the remote storage configuration in `rclone`.
- `project_dir`: The directory of the project.

### `.gitignore`

This file specifies files and directories that should be ignored by Git. It includes log files, configuration files, and any files matching the `homolog*` pattern.

## Dependencies

- **Zsh**: The scripts are written in Zsh.
- **Bash**: The configuration script (`config.sh`) is written in Bash.
- **rsync**: Required for the backup process.
- **tar**: Required for compressing the backup.
- **rclone**: Required for the upload process.

Ensure all dependencies are installed and configured correctly before running the scripts.

Citations:
[1] https://github.com/wouterbles/rclone-backup
[2] https://medium.com/nerd-for-tech/organize-and-auto-back-up-your-zshrc-files-to-github-364a262b3227
[3] https://forum.rclone.org/t/ive-made-a-nice-backup-script-tutorial-for-rclone/4999
[4] https://github.com/vncloudsco/rclonebackup
[5] https://forum.rclone.org/t/backup-rclone-conf-on-github/20686
[6] https://www.youtube.com/watch?v=AYZdnqchUOE
[7] https://forum.rclone.org/t/backup-script-suitable-for-cron/44147
[8] https://forum.rclone.org/t/rclone-copy-didnt-find-section-in-config-file/8531
[9] https://formulae.brew.sh/formula/