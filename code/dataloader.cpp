// #pragma once

#include <iostream>
#include <cstdlib>
#include "client_manager.cpp"
#include "query_filter.cpp"
#include <string>


using namespace std;

int main(int argc, char const *argv[]){

    if(argc < 2){
        cout << "Argumentos insuficientes" << endl;
        exit(0);
    }
    QueryFilter qf = QueryFilterSql("test");
    ClientManager cm = ClientManagerSql();

    // string file_name = string(argv[1]);
    // process_dns_log(file_name);
    // DomainFeaturesCalculator dfc = DomainFeaturesCalculator(file_name+FILTERED_SUFIX);
    // dfc.Calculate();
    //cout << calculate_features(process_dns_log(file_name)) << endl;

    return 0;
}