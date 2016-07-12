#pragma once

#include "dns_query.h"
#include <libpq-fe.h>

class QueryStorage {
public:
	QueryStorage() {
	}
	virtual ~QueryStorage(){

	}
	virtual void save(DnsQuery query) = 0;
};

class QueryStorageSql: public QueryStorage {
private:
	PGconn* m_connection;
public:
	void save(DnsQuery query);

	void addDomain(string domain);

	bool containsDomain(string domain);

	void addClient(string client_ip);

	bool containsClient(string client_ip);

	QueryStorageSql();

	~QueryStorageSql();
};