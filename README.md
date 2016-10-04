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
	
	* A pasta destino do build deve estar no mesmo nível que a pasta ``code``
4. Na sessão ``Run`` selecione o endereço da pasta ``pfc_botnets_qt`` como ``Working directory``
	
	![image](./run.png =400x)

##### Instalando Pacotes para Python

1. Baixe o conteúdo da página [https://bootstrap.pypa.io/get-pip.py](https://bootstrap.pypa.io/get-pip.py)
2. No diretório do ``get-pip.py``,  execute ``sudo python get-pip.py``
3. No diretório base do projeto, execute ``sudo pip install -r requirements.txt``