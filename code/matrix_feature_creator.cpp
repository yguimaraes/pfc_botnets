// #pragma once

#include <iostream>
#include <cstdlib>
#include "types/raw_fields.h"
#include "features_calculator.cpp"
#include "domain_features_calculator.cpp"
#include <fstream>
#include <list>

using namespace std;

const string FILTERED_SUFIX = "(filtered)";

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

int calculate_features(list<raw_fields> log_itens) {
    list <raw_fields>::iterator iter;
    for(iter = log_itens.begin(); iter != log_itens.end(); iter++) {
        FeaturesCalculator fc = FeaturesCalculator(*iter);
        fc.Calculate();
    }
    return log_itens.size();
}

int main(int argc, char const *argv[]){

    if(argc < 2){
        cout << "Argumentos insuficientes" << endl;
        exit(0);
    }

    string file_name = string(argv[1]);
    process_dns_log(file_name);
    DomainFeaturesCalculator dfc = DomainFeaturesCalculator(file_name+FILTERED_SUFIX);
    dfc.Calculate();
    //cout << calculate_features(process_dns_log(file_name)) << endl;

    return 0;
}