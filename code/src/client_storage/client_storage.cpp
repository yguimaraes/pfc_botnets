#include "client_storage.h"

ClientStorageSql::ClientStorageSql(){
using namespace std;

}

ClientStorageSql::~ClientStorageSql(){
	PQfinish(m_connection);
}

void ClientStorageSql::save(){

unordered_set<string> * ClientStorageSql::get_clients(){
	unordered_set<string> * clients = new unordered_set<string>();
	string sSQL = "SELECT client_ip FROM clients;";
	PGresult * res = PQexec(m_connection, sSQL.c_str());
	for (int i = 0; i < PQntuples(res); i++){
		clients->insert(PQgetvalue(res, i, 0));
	}
	PQclear(res);
	return clients;
}