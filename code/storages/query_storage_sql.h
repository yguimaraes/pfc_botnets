#include "libpq-fe.h"
#include "query_storage.h"
#include "../domain_features_calculator.cpp"

class QueryStorageSQL: public QueryStorage {
private:
	PGconn* m_connection;
public:
	void save(DnsQuery query){
		if(!containsDomain(query.m_domain))
			addDomain(query.m_domain);
	}

	void addDomain(string domain) {
		DomainFeaturesCalculator dfc(domain);
		string sSQL = "INSERT INTO domains (domain, length,numeric_count) VALUES('";
		sSQL.append(dfc.getDomain());
		sSQL.append("',");
		sSQL.append(to_string(dfc.CalculateDomainLength()));
		sSQL.append(",");
		sSQL.append(to_string(dfc.CalculateNumberOfDigits()));
		sSQL.append(");");
		PGresult *res = PQexec(m_connection, sSQL.c_str());
		PQclear(res);
	}

	bool containsDomain(string domain){
		bool result = false;
		string sSQL = "SELECT * FROM domains WHERE domain LIKE '";
		sSQL.append(domain);
		sSQL.append("';");
		PGresult *res = PQexec(m_connection, sSQL.c_str());
		if(PQntuples(res) > 0){
			result=true;
		}
		PQclear(res);
		return result;
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