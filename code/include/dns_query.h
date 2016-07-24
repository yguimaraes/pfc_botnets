#pragma once

#include <string>
using namespace std;

class DnsQuery {
public:
	string m_date;
	string m_time;
	string m_client_ip;
	string m_client_port;
	string m_domain;
	string m_type;
	string m_dns_server_ip;
	bool m_is_type_a;
	bool m_is_type_mx;
	bool m_is_type_txt;
	bool m_is_type_cname;

	string toString();
	DnsQuery(string request_line);
private:
	void SetTypes();
};