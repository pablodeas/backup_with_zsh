# Projeto de Backup e Upload

Este projeto consiste em dois scripts em Zsh, `do_backup.zsh` e `do_upload.zsh`, que realizam tarefas de backup e upload de arquivos.

## Descrição

O script `do_backup.zsh` realiza um backup do diretório especificado e compacta os arquivos em um arquivo .tar.gz. Ele também exclui certos diretórios do backup. Após a criação do backup, o script move os arquivos de log para o diretório de backup.

O script `do_upload.zsh` verifica se o diretório de backup existe e, em seguida, faz o upload de todos os arquivos no diretório de backup para o Google Drive usando o comando `gdrive files upload`.

## Instalação

Para usar esses scripts, você precisa ter o Zsh e o gdrive instalado em seu sistema. 
O gdrive é uma ferramenta que permite interagir com o Google Drive a partir da linha de comando. 
Para instalar a ferramenta `gdrive`, acesse o link:

[Gdrive](https://github.com/glotlabs/gdrive)

## Uso

Para usar os scripts, você precisa dar permissões de execução para eles. Você pode fazer isso usando o comando `chmod +x do_backup.zsh do_upload.zsh`.

Para executar o script de backup, use o comando `./do_backup.zsh`.

Para executar o script de upload, use o comando `./do_upload.zsh`.

## Contribuições

Contribuições para este projeto são bem-vindas. Se você encontrar um bug ou tiver uma sugestão de melhoria, por favor, abra uma issue ou envie um pull request.

## Autores

- Pablo Andrade

## Badges

![Zsh](https://img.shields.io/badge/Zsh-1.2-blue)
![Google Drive](https://img.shields.io/badge/Google%20Drive-v3.0.0-green)
