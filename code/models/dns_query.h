#pragma once

#include <string>

using namespace std;

class DnsQuery {
public:
	string m_date;
	string m_time;
	string m_client_ip;
	string m_client_port;
	string m_url;
	string m_package_record_type;
	string m_dns_server_ip;

	string toString();
	DnsQuery(string query_line);
};