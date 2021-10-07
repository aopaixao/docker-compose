# Descrição
Conteineres docker contendo uma imagem "hello-world" e uma network. 

## Detalhes sobre os serviços
Após ser inicializada (via docker-compose up) o seriviço/imagem "hello-world" será finalizado, mantendo disponível a network. Com isso será possível utilizar essa network como rede externa em outros conteineres docker.

## Verificando o status da network
Para conferir se a network está disponível, execute o seguinte comando

```bash
docker network ls
```
## Sobre

- Author - [Alexandre Paixão]

## Licença

GNU GPL

