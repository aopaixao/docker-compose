# Descrição - Arquivo de configuração Docker Compose para Apache
Arquivos de configuração para o serviço Apache/httpd

# Funcionalidades Implementadas

* Dockerfile: configuração específicas e de variáveis de ambiente
* vhost: configuração do host virtual

# Estrutura da Pasta e Subpastas

* docker-compose.yml : arquivo de configuração do serviço
* host_files: pasta contendo os arquivos a serem servidos pelo apache (deverá ser criada)
* dockerfiles:
  * apache.dockerfile : arquivo contendo configurações adicionais para o serviço
  * config
    * vhost.conf : arquivo de configuração do host virtual
     

# Comandos

## Subir a aplicação

```bash
docker compose up
```

# Sobre

- Author - [Alexandre Paixão]

# Licença

GNU GPL





