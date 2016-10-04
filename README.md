# Instruções

## Configurações

- Qt creator 4.1.0
- PostGreSQL 9.5.4
- Python 2.7

## Instruções para UNIX

##### Construindo o Projeto no Qt

1. Importe o projeto na pfc_botnets_qt/pfc_botnets_qt.pro
2. Aceite proceguir com as configurações antigas
3. Modifique o path de "Build directory" para uma pasta a sua escolha
	
	![image](./build.png =400x)
	
	* A pasta destino do build deve estar no mesmo nível que a pasta ``code/``
4. Na sessão ``Run`` selecione o endereço da pasta ``pfc_botnets_qt/`` como ``Working directory``
	
	![image](./run.png =400x)

##### Instalando Pacotes para Python

1. Baixe o conteúdo da página [https://bootstrap.pypa.io/get-pip.py](https://bootstrap.pypa.io/get-pip.py)
2. No diretório do ``get-pip.py``,  execute ``sudo python get-pip.py``
3. No diretório base do projeto, execute ``sudo pip install -r requirements.txt``

##### Construindo o Banco de Dados

1. Inicie o servidor de banco de dados
	* **OS X:** Inicie com o comando ``pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start``.
		* Mais informações podem ser encontradas [aqui](http://stackoverflow.com/questions/7975556/how-to-start-postgresql-server-on-mac-os-x)
	* **Linux:** Não houve testes para esse caso, mas instruções para Ubuntu podem ser encontradas [aqui](https://help.ubuntu.com/community/PostgreSQL)
2. Para construir o banco de dados, execute ``createdb botnets_pfc``
3. Para definir a tabela, execute na pasta ``<BASE_DO_PROJETO>/code/db`` o comando ``psql botnets -f schema.sql``

**Para deletar o banco de dados, basta executar** ``dropdb botnets_pfc``