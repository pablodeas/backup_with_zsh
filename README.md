## Sobre o Projeto

Este é um script que faz backup de um diretório específico, compacta o backup e o envia para o Google Drive.

## Como Utilizar

### Pré-requisitos

Antes de executar o script, certifique-se de que:

1. Você tem permissões de leitura e escrita no diretório que está sendo salvo no backup.
2. Você tem a ferramenta `gdrive` instalada e configurada em seu sistema.

Para instalar a ferramenta `gdrive`, acesse o link:

[Gdrive](https://github.com/glotlabs/gdrive)

### Executando o Script

Para executar o script, você pode usar o seguinte comando no terminal:

```zsh
./do_backup.zsh
```

No meu caso específico, eu utilizo da seguinte forma:

```zsh
sudo nohup ./do_backup.zsh > log_backup.txt 2>&1 &
```

Assim, o script é executado em segundo plano e salva os logs no arquivo `log_backup.txt`


## Como Funciona

O script funciona da seguinte maneira:

1. O script faz backup do diretório especificado, excluindo certos subdiretórios.
2. O backup é então compactado em um arquivo tar.gz.
3. O arquivo de backup é enviado para o Google Drive usando a ferramenta `gdrive`.

## Estrutura do Script

O script é estruturado da seguinte maneira:

- Define as variáveis para o diretório de backup, o diretório principal e o nome do arquivo de backup.
- Verifica se o arquivo de backup já existe. Se existir, o script é interrompido.
- Faz o backup do diretório principal para o diretório de backup.
- Compacta o backup em um arquivo tar.gz.
- Envia o arquivo de backup para o Google Drive.

## Contribuição

Contribuições são bem-vindas! Se você encontrar um bug ou tiver uma sugestão de melhoria, por favor, abra uma issue.
