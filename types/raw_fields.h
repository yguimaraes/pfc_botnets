#pragma once

#include <string>

using namespace std;

struct raw_fields
{
	string date;
	string time;
	string client_ip;
	int client_port;
	string url;
	string package_record_type;
	string dns_server_ip;
};