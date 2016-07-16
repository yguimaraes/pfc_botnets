#pragma once

#include <unordered_set>
#include <string>
#include <libpq-fe.h>

class ClientStorage
{
public:
	virtual void save() = 0;
	virtual unordered_set<string> * get_clients() = 0;
};

class ClientStorageSql: public ClientStorage{
	PGconn* m_connection;
public:
	ClientStorageSql();
	~ClientStorageSql();
	void save();
	unordered_set<string> * get_clients();
};