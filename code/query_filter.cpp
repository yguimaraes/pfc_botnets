#pragma once

#include <iostream>
#include "types/raw_fields.h"
#include <fstream>
#include <list>
#include <regex>
#include "domain_features_calculator.cpp"

const string FILTERED_SUFIX = "(filtered)";

class QueryFilter{

protected:

    raw_fields filter_fields(string request_line){
        // ");//
        raw_fields compiled_fields = raw_fields();
        regex request_line_re("(\\d+-\\w+-\\d+) (\\d+:\\d+:\\d+.?\\d*) queries: info: client (\\d+\\.\\d+\\.\\d+\\.\\d+)#(\\d+): query: ([^ ]+) IN (\\w+) (?:\\+|-|-EDC) \\((\\d+\\.\\d+\\.\\d+\\.\\d+)\\)");
        smatch request_line_match; //= sregex_iterator(request_line.begin(), request_line.end(), request_line_re);

        regex_search(request_line, request_line_match, request_line_re);

        compiled_fields.date = request_line_match[1];
        compiled_fields.time = request_line_match[2];
        compiled_fields.client_ip = request_line_match[3];
        compiled_fields.client_port = request_line_match[4];
        compiled_fields.url = request_line_match[5];
        compiled_fields.package_record_type = request_line_match[6];
        compiled_fields.dns_server_ip = request_line_match[7];
        
        return compiled_fields;
    }

    list<raw_fields> process_dns_log(string file_name){
        
        ifstream dns_log_file;
        ofstream filtered_dns_log_file(file_name+FILTERED_SUFIX);
        list<raw_fields> dns_log_list;
        string request_line;

        dns_log_file.exceptions ( ifstream::failbit );
        
        try{
            dns_log_file.open(file_name);
        
            while (getline(dns_log_file, request_line)){
                if (request_line.empty())
                    continue;
                raw_fields current = filter_fields(request_line);
                filtered_dns_log_file << current.toString() << endl;
                dns_log_list.push_back(current);
            }

            dns_log_file.close();
            filtered_dns_log_file.close();
        }
        
        catch(ifstream::failure e){
            cerr << "Exception opening/reading file" << endl;
        }

        // cout << dns_log_list.size() << endl;
        
        return dns_log_list;
    }
public:
    
    QueryFilter(string path){
        DomainFeaturesCalculator a = DomainFeaturesCalculator("www.google.com");
    }
};

class QueryFilterSql: public QueryFilter{
public:
    QueryFilterSql(string path): QueryFilter(path){};
};

class QueryFilterFile: public QueryFilter{
};