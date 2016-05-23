#pragma once

#include <string>

using namespace std;

class raw_fields
{
public:
	string date;
	string time;
	string client_ip;
	string client_port;
	string url;
	string package_record_type;
	string dns_server_ip;

	string toString() {
		return date + "," + time + "," + client_ip + "," + client_port + "," + url + "," + package_record_type + "," + dns_server_ip;
	}
};