#pragma once

#include <unordered_set>
#include <string>
#include <libpq-fe.h>
#include "client_info.h"

using namespace std;

class ClientStorage
{
public:
	virtual void save(ClientInfo*) = 0;
	virtual unordered_set<string> * get_clients() = 0;
};

class ClientStorageSql: public ClientStorage{
	PGconn* m_connection;
public:
	ClientStorageSql();
	~ClientStorageSql();
	void save(ClientInfo*);
	unordered_set<string> * get_clients();
};