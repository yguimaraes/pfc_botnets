#include "models/dns_query.h"
#include "storages/query_storage.h"
#include <fstream>

using namespace std;

class QueryExecuter {
    ifstream dns_log_file;
    QueryStorage* query_storage;
public:
    QueryExecuter(string path, QueryStorage* qs){
    	dns_log_file.open(path);
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
            DnsQuery current_query = DnsQuery(request_line);
            query_storage->save(current_query);
        }
    }
};