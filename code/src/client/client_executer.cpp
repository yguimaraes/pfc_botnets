#include "client_executer.h"
#include "client_storage.h"
#include "client_calculator.h"

using namespace std;

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
	unordered_set<string> * clients = client_storage->get_clients();
	ClientCalculator * cc = NULL;
	ClientInfo * ci = NULL;
	for (unordered_set<string>::iterator it = clients->begin(); it != clients->end(); it++){
		cc = new ClientCalculator(*it);
		ci = cc->get_results();
		client_storage->save(ci);
		delete cc;
		delete ci;
	}
	delete clients;
};