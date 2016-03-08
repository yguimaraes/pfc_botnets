// #pragma once

#include <iostream>
#include <cstdlib>
#include "types/raw_fields.h"
#include <fstream>
#include <list>


using namespace std;


list<raw_fields> process_dns_log(string file_name){
    
    ifstream dns_log_file;
    list<raw_fields> dns_log_list;
    string request_line;

    dns_log_file.exceptions ( ifstream::failbit );
    
    try{
        dns_log_file.open(file_name);
    
        while (getline(dns_log_file, request_line)){
            // TODO create new raw_fields instance for each line and add to dns_log_list
            cout << request_line << endl;
        }
    
        dns_log_file.close();
    }
    
    catch(ifstream::failure e){
        cerr << "Exception opening/reading file" << endl;
    }
    
    return dns_log_list;
}

int main(int argc, char const *argv[]){

    if(argc < 2){
        cout << "Argumentos insuficientes" << endl;
        exit(0);
    }

    std::string file_name = std::string(argv[1]);

    process_dns_log(file_name);
    return 0;
}