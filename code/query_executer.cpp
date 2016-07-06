#include "models/dns_query.h"
#include "storages/query_storage.h"
#include <fstream>
#include <string>
#include <unordered_set>
#include <iostream>

using namespace std;

class QueryExecuter {
    ifstream dns_log_file;
    QueryStorage* query_storage;
    unordered_set<string> whitelist;
public:
    QueryExecuter(string path, QueryStorage* qs){
        dns_log_file.exceptions( std::ifstream::failbit | std::ifstream::badbit );
        
        try {
    	
           dns_log_file.open(path);
        
        } catch(std::ifstream::failure e) {
        
            cerr << "Failed to open file: " << path << endl << "check the path"
            " on code/query_filter.h" << endl;
            exit(1);
        }
        
        whitelist.insert("200.20.120.45");
        whitelist.insert("200.20.189.41");
        whitelist.insert("200.20.218.11");
        whitelist.insert("200.20.189.58");
        whitelist.insert("200.20.188.117");

    	query_storage = qs;
    };

    ~QueryExecuter(){
    	dns_log_file.close();
    }

	void ProcessDnsLog(){
        string request_line;
        while (getline(dns_log_file, request_line)){
            if (request_line.empty())
                continue;
            DnsQuery current_query(request_line);
            if(whitelist.count(current_query.m_client_ip) == 0){
                query_storage->save(current_query);
            }
        }
    }
};