#include <fstream>
#include <unordered_set>
#include <iostream>
#include "dnsquery.h"
#include "queryexecuter.h"

using namespace std;

QueryExecuter::QueryExecuter(string path, QueryStorage* qs, int log_id){
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
    m_path = path;
    m_log_id = log_id;
};

QueryExecuter::~QueryExecuter(){
    dns_log_file.close();
}

void QueryExecuter::ProcessDnsLog(){
    string request_line;
    int i = 0;
    try{
        while (getline(dns_log_file, request_line)){
            i++;
            if (request_line.empty())
                continue;
            if (!(i%10000) && i > 0){
                printf("\rProcessed %d requests", i);
                fflush(stdout);
            }
            try{
                DnsQuery current_query(request_line);
                if(whitelist.count(current_query.m_client_ip) == 0){
                        query_storage->save(current_query, m_log_id);
                    }
                }
            catch(std::runtime_error &e){
                printf("%s\n", e.what());
            }
        }
    } catch(std::ifstream::failure e){
        printf("\nFinished processing file: '%s'\n", m_path.c_str());
    }
}
