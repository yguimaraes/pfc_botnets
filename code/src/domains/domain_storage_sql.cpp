#include <libpq-fe.h>
#include "domain_storage.h"
#include "domain_features_calculator.h"

void DomainStorageSql::updateAllDegrees(){
	string sSQL = "UPDATE domains x SET requisition_degree = y.requisition_count FROM ( SELECT domains.domain, count(DISTINCT dns_queries.client_ip) as requisition_count FROM domains INNER JOIN dns_queries ON domains.domain=dns_queries.domain GROUP BY domains.domain) AS y WHERE x.domain = y.domain;";
	PGresult *res = PQexec(m_connection, sSQL.c_str());
	PQclear(res);
}

DomainStorageSql::DomainStorageSql(){
	m_connection = PQconnectdb(
		"dbname=botnets_pfc hostaddr=127.0.0.1 port=5432"
	);
}

DomainStorageSql::~DomainStorageSql(){
	PQfinish(m_connection);
}