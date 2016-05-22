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
		if(!containsClient(query.m_client_ip))
			addClient(query.m_client_ip);
		string sSQL = "INSERT INTO dns_queries (client_ip,domain, type) VALUES('";
		sSQL.append(query.m_client_ip);
		sSQL.append("','");
		sSQL.append(query.m_domain);
		sSQL.append("','");
		sSQL.append(query.m_type);
		sSQL.append("');");
		PGresult *res = PQexec(m_connection, sSQL.c_str());
		PQclear(res);
	}

	void addDomain(string domain) {
		DomainFeaturesCalculator dfc(domain);
		string sSQL = "INSERT INTO domains (domain,length,numeric_count,is_in_whitelist, readable_string_length) VALUES('";
		sSQL.append(dfc.getDomain());
		sSQL.append("',");
		sSQL.append(to_string(dfc.CalculateDomainLength()));
		sSQL.append(",");
		sSQL.append(to_string(dfc.CalculateNumberOfDigits()));
		sSQL.append(",'");
		sSQL.append(to_string(dfc.isInWhiteList()));
		sSQL.append("',");
		sSQL.append(to_string(dfc.ReadableStringLength()));
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

	void addClient(string client_ip) {
		string sSQL = "INSERT INTO clients (client_ip) VALUES('";
		sSQL.append(client_ip);
		sSQL.append("');");
		PGresult *res = PQexec(m_connection, sSQL.c_str());
		PQclear(res);
	}

	bool containsClient(string client_ip){
		bool result = false;
		string sSQL = "SELECT * FROM clients WHERE client_ip LIKE '";
		sSQL.append(client_ip);
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