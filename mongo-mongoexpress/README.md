# Descrição
Conteineres docker com mongodb e mongo-express

## Executando
Para subir os conteineres será necessário criar um arquivo .env com as seguintes variáveis:


```bash
MONGO_ROOT_USERNAME="USER"
MONGO_ROOT_PASSWORD="PASS"
MONGO_DATABASE="DB_NAME"
MONGO_DATABASE_USER="DB_USER"
MONGO_DATABASE_PASSWD="DB_PASS"
ME_WEB_USERNAME="WEBCONSOLE_USERNAME"
ME_WEB_PASSWD="WEBCONSOLE_PASS"
```

## Observação
Os serviços mongo e mongo-express utilizam uma network previamente criada (disponível aqui). Logo, caso não queira utilizar uma network pré-existente, remova as últimas 4 linhas do docker-compose.yml.


## Sobre

- Author - [Alexandre Paixão]

## Licença

GNU GPL
