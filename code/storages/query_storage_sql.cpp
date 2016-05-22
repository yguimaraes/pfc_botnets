#include "libpq-fe.h"
#include "query_storage.h"

class QueryStorageSQL {
private:
	PGconn* m_connection;
public:
	virtual void save(DnsQuery query){

	}

	QueryStorageSQL(){
		m_connection = PQconnectdb(
			"dbname=botnets_pfc hostaddr=127.0.0.1 port=5432"
		);
	}

	~QueryStorageSQL(){
		PQfinish(m_connection);
	}
}