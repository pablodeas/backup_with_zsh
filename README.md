## Backup de Diretórios

### Descrição
Este script é usado para criar um backup de um diretório específico em um sistema Linux. Ele usa os comandos `rsync` e `tar` para fazer o backup e compactá-lo em um arquivo .tar.gz.

### Como Executar o Script
Para executar este script, você precisa ter permissões de leitura no diretório que está sendo feito backup e permissões de gravação no diretório de destino.

Primeiro, navegue até o diretório onde o script está localizado. Em seguida, torne o script executável com o comando `chmod +x script.sh`, substituindo `script.sh` pelo nome do seu script.

Depois de tornar o script executável, você pode executá-lo com o comando `./script.sh`.

### Como o Script Funciona
O script começa definindo as variáveis `bkp_directory`, `main_directory` e `data`. `bkp_directory` é o diretório onde o backup será salvo, `main_directory` é o diretório que será incluído no backup e `data` é a data atual, que será usada para nomear o arquivo de backup.

O script então executa o comando `rsync` para criar um backup do diretório `main_directory` no diretório `bkp_directory`, excluindo certos diretórios especificados. Se o backup for criado com sucesso, o script então compacta o backup usando o comando `tar`.

Se ocorrer um erro durante a criação do backup, o script exibe uma mensagem de erro.

## Mensagens de Erro
Se o script encontrar um erro durante a execução, ele exibirá uma mensagem de erro. A mensagem de erro indica que houve um erro ao criar o backup e sugere que você verifique os logs no arquivo especificado.
