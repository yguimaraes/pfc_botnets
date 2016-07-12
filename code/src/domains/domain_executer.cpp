#include "domain_filter.h"
#include "domain_executer.h"

void DomainExecuter::CalculateDomainDegrees(){
    for(int i=0; i<24; i++){   
        printf("Processing file %d \n", i);   
        QueryExecuter query_executer(files[i], m_storage);
        query_executer.ProcessDnsLog();
    }
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

DomainExecuter::~DomainExecuter(){
    delete m_storage;
}

DomainExecuter::DomainExecuter(){};