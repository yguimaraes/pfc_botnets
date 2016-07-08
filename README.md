# Botnet Detection

## Final Project

This is our Final Project on Computer Engineering Course. Our aim is to use a Clustering Algorithm to detect a Botnet

Dependências:

- [PostgreSQL](https://www.postgresql.org/download/)
- [Boost](https://sourceforge.net/projects/boost/files/boost/1.61.0/)

Para iniciar é necessário criar um banco de dados PostgreSQL. Certifique-se que o servidor do Banco de Dados está ativo e siga os seguintes passos:

1. Crie o banco de dados: `createdb botnets_pfc`
2. Execute o script: `psql botnets_pfc -f"./code/db/schema.sql"`

Para compilar basta executar

1. `cd code`
2. `make`

Para iniciar execute `./dataloader.run`

##Nota importante:

O makefile vai compilar qualquer arquivo na pasta `/src` até 1 pastas de profundidade partindo da `/src` e vai incluir os headers da pasta `/include`
