#include "libpq-fe.h"
#include "query_storage.h"

class QueryStorageSQL: public QueryStorage {
private:
	PGconn* m_connection;
public:
	void save(DnsQuery query){
		std::string sSQL = "INSERT INTO domains (domain) VALUES('";
		sSQL.append(query.m_url);
		sSQL.append("');");

		PGresult *res = PQexec(m_connection, sSQL.c_str());
		PQclear(res);
	}

	QueryStorageSQL(){
		m_connection = PQconnectdb(
			"dbname=botnets_pfc hostaddr=127.0.0.1 port=5432"
		);

	}

	~QueryStorageSQL(){
		PQfinish(m_connection);
	}
};