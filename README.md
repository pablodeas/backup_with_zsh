## Sobre o Projeto

Este é um script que faz backup de um diretório específico, compacta o backup e o envia para o Google Drive.

## Como Utilizar

### Pré-requisitos

Antes de executar o script, certifique-se de que:

1. Você tem permissões de leitura e escrita no diretório que está sendo salvo no backup.
2. Você tem a ferramenta `gdrive` instalada e configurada em seu sistema.
3. Você alterou os caminhos de origem e destino de forma que atenda ao que você necessita.

Para instalar a ferramenta `gdrive`, acesse o link:

[Gdrive](https://github.com/glotlabs/gdrive)

### Executando o Script

Para executar o script, você pode usar o seguinte comando no terminal:

```zsh
./do_backup.zsh
```

No meu caso específico, eu utilizo da seguinte forma:

```zsh
./do_backup.zsh > backup.log 2>&1
```

Assim, registrando os logs no arquivo backup.log.

## Como Funciona

O script funciona da seguinte maneira:

1. O script faz backup do diretório especificado, excluindo certos subdiretórios.
2. Caso a compactação ocorra sem erros, o backup é então compactado em um arquivo tar.gz.
3. Após, caso o arquivo exista, é feito o upload do mesmo para o Google Drive.

## Estrutura do Script

O script é estruturado da seguinte maneira:

- Define as variáveis para o diretório de backup, o diretório principal e o nome do arquivo de backup.
- Verifica se o arquivo de backup já existe. Se existir, o script é interrompido.
- Faz o backup do diretório principal para o diretório de backup.
- Compacta o backup em um arquivo tar.gz.
- Envia para o Drive.

## Contribuição

Contribuições são bem-vindas! Se você encontrar um bug ou tiver uma sugestão de melhoria, por favor, abra uma issue.
