#include <libpq-fe.h>
#include "domain_storage.h"
#include <iostream>
#include "domain_features_calculator.h"

void DomainStorageSql::updateAllDegrees(){
	string sSQL = "UPDATE domains x SET requisition_degree = y.requisition_count FROM ( SELECT domains.domain, count(DISTINCT dns_queries.client_ip) as requisition_count FROM domains INNER JOIN dns_queries ON domains.domain=dns_queries.domain GROUP BY domains.domain) AS y WHERE x.domain = y.domain;";
	PGresult *res = PQexec(m_connection, sSQL.c_str());
	PQclear(res);

	std::cout << "Update clients info with domains properties";
	sSQL = "UPDATE clients x SET count_domain_with_numbers = y.count_domain_with_numbers, average_domain_length = y.average_domain_length, std_domain_length = y.std_domain_length, average_requisition_degree = y.average_requisition_degree, std_requisition_degree = y.std_requisition_degree, minimum_requistion_degree = y.minimum_requistion_degree FROM ( SELECT clients.client_ip, COUNT(domains.numeric_count) as count_domain_with_numbers, AVG(domains.length) as average_domain_length, STDDEV_POP(domains.length) as std_domain_length, AVG(domains.requisition_degree) as average_requisition_degree, STDDEV_POP(domains.requisition_degrees) as std_requisition_degree, MIN(domains.requisition_degrees) as minimum_requistion_degree FROM clients INNER JOIN ( SELECT DISTINCT dns_queries.domain, dns_queries.client_ip FROM dns_queries) as z ON clients.client_ip = z.client_ip INNER JOIN domains ON z.domain = domains.domain GROUP BY clients.client_ip ) AS y WHERE x.client_ip = y.client_ip;";
	PGresult *res2 = PQexec(m_connection, sSQL.c_str());
	PQclear(res2);

	std::cout << "Update clients info with count_requests";
	sSQL = "UPDATE clients x SET count_request = y.count_request FROM( SELECT clients.client_ip, count(dns_queries.id) as count_request FROM clients INNER JOIN dns_queries ON dns_queries.client_ip = clients.client_ip GROUP BY clients.client_ip ) AS y WHERE x.client_ip = y.client_ip;";
	PGresult *res3 = PQexec(m_connection, sSQL.c_str());
	PQclear(res3);
}

DomainStorageSql::DomainStorageSql(){
	m_connection = PQconnectdb(
		"dbname=botnets_pfc hostaddr=127.0.0.1 port=5432"
	);
}

DomainStorageSql::~DomainStorageSql(){
	PQfinish(m_connection);
}