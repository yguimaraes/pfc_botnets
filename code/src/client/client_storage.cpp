#include "client_storage.h"

using namespace std;

ClientStorageSql::ClientStorageSql(){
	m_connection = PQconnectdb(
		"dbname=botnets_pfc hostaddr=127.0.0.1 port=5432"
	);
}

ClientStorageSql::~ClientStorageSql(){
	PQfinish(m_connection);
}

void ClientStorageSql::save(ClientInfo * client_info){
	string sSQL = "UPDATE clients SET ";

	sSQL.append(" count_domain_with_numbers = ");
	sSQL.append("'");
	sSQL.append(to_string(client_info->CountDomainWithNumbers));
	sSQL.append("'");

	sSQL.append(" average_domain_length = ");
	sSQL.append("'");
	sSQL.append(to_string(client_info->AverageDomainLength));
	sSQL.append("'");

	sSQL.append(", std_domain_length = ");
	sSQL.append("'");
	sSQL.append(to_string(client_info->StdDomainLength));
	sSQL.append("'");

	sSQL.append(", average_request_interval = ");
	sSQL.append("'");
	sSQL.append(to_string(client_info->AverageRequestInterval));
	sSQL.append("'");

	sSQL.append(", std_request_interval = ");
	sSQL.append("'");
	sSQL.append(to_string(client_info->StdRequestInterval));
	sSQL.append("'");

	sSQL.append(", count_request = ");
	sSQL.append("'");
	sSQL.append(to_string(client_info->CountRequest));
	sSQL.append("'");

	sSQL.append(", average_click_size = ");
	sSQL.append("'");
	sSQL.append(to_string(client_info->AverageClickSize));
	sSQL.append("'");

	sSQL.append(", minimum_click_size = ");
	sSQL.append("'");
	sSQL.append(to_string(client_info->MinimumClickSize));
	sSQL.append("'");

	sSQL.append(", count_request_cname = ");
	sSQL.append("'");
	sSQL.append(to_string(client_info->CountRequestCname));
	sSQL.append("'");

	sSQL.append(", percentage_request_cname = ");
	sSQL.append("'");
	sSQL.append(to_string(client_info->PercentageRequestCname));
	sSQL.append("'");

	sSQL.append(", count_request_a = ");
	sSQL.append("'");
	sSQL.append(to_string(client_info->CountRequestA));
	sSQL.append("'");

	sSQL.append(", percentage_request_a = ");
	sSQL.append("'");
	sSQL.append(to_string(client_info->PercentageRequestA));
	sSQL.append("'");

	sSQL.append(", count_request_mx = ");
	sSQL.append("'");
	sSQL.append(to_string(client_info->CountRequestMx));
	sSQL.append("'");

	sSQL.append(", percentage_request_mx = ");
	sSQL.append("'");
	sSQL.append(to_string(client_info->PercentageRequestMx));
	sSQL.append("'");

	sSQL.append(", count_request_txt = ");
	sSQL.append("'");
	sSQL.append(to_string(client_info->CountRequestTxt));
	sSQL.append("'");

	sSQL.append(", percentage_request_txt = ");
	sSQL.append("'");
	sSQL.append(to_string(client_info->PercentageRequestTxt));
	sSQL.append("'");
	
	sSQL.append(" WHERE client_ip = ");
	sSQL.append("('");
	sSQL.append(client_info->IpAddress);
	sSQL.append("')");
	sSQL.append(";");

	printf("%s\n", sSQL.c_str());

	PGresult *res = PQexec(m_connection, sSQL.c_str());
	PQclear(res);
}

unordered_set<string> * ClientStorageSql::get_clients(){
	unordered_set<string> * clients = new unordered_set<string>();
	string sSQL = "SELECT client_ip FROM clients;";
	PGresult * res = PQexec(m_connection, sSQL.c_str());
	for (int i = 0; i < PQntuples(res); i++){
		clients->insert(PQgetvalue(res, i, 0));
	}
	PQclear(res);
	return clients;
}