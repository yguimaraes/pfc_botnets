#include <string>
#include <regex>
#include "dns_query.h"

using namespace std;

string DnsQuery::toString(){
	return m_date + "," + m_time + "," + m_client_ip + "," + m_client_port + "," + m_domain + "," + m_type + "," + m_dns_server_ip;
}

DnsQuery::DnsQuery(string request_line){
    regex request_line_re("(\\d+-\\w+-\\d+) (\\d+:\\d+:\\d+.?\\d*) queries: info: client (\\d+\\.\\d+\\.\\d+\\.\\d+)#(\\d+): query: ([^ ]+) IN (\\w+) [\\+|-](?:EDC||ED|EC|E) \\((\\d+\\.\\d+\\.\\d+\\.\\d+)\\)");
    smatch request_line_match; //= sregex_iterator(request_line.begin(), request_line.end(), request_line_re);

    regex_search(request_line, request_line_match, request_line_re);

    m_date = request_line_match[1];
    m_time = request_line_match[2];
    m_client_ip = request_line_match[3];
    m_client_port = request_line_match[4];
    m_domain = request_line_match[5];
    m_type = request_line_match[6];
    m_dns_server_ip = request_line_match[7];
    
    if(m_domain.empty())
        throw std::runtime_error("Couldn't match: '" + request_line + "'");
}