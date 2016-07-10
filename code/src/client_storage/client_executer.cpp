#include "client_executer.h"

ClientExecuter::ClientExecuter(std::string type){
	if (type == "sql"){
		client_storage = new ClientStorageSql();
	} else {
		client_storage = NULL;
	}

};

ClientExecuter::~ClientExecuter(){
	if (client_storage)
		delete client_storage;
};

void ClientExecuter::update(){
	
};