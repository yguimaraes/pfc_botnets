#pragma once

#include "dns_query.h"
#include <libpq-fe.h>

class DomainStorage {
public:
	DomainStorage() {
	}
	virtual ~DomainStorage(){

	}
	virtual void updateAllDegrees() = 0;
};

class DomainStorageSql: public DomainStorage {
private:
	PGconn* m_connection;
public:
	void updateAllDegrees();

	DomainStorageSql();

	~DomainStorageSql();
};