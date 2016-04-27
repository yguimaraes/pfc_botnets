using namespace std;
#include <iostream>
#include <cstdlib>
#include <fstream>
#include <unordered_set>
#include <list>
#include <vector>   
#include <boost/algorithm/string.hpp>

class DomainFeaturesCalculator{
    unordered_set<string> domains;
    void CalculateNumberOfDigits() {
    }
    void IsSufixSuspect(){
        // TODO Checar se sufixo está na lista_tld.txt
        
    }

    void CalculateDomainLength(){
        // TODO

    }

    void GetFeatures(){
        // TODO extract all results
    }

    string get_domain_from_log_row(string row){
        vector<string> splitted_vector;
        boost::split(splitted_vector, row, boost::is_any_of(","));
        return splitted_vector[4];
    }
public:
    DomainFeaturesCalculator(string file_name){
        ifstream treated_dns_log_file(file_name);
        string current_line;
        if (treated_dns_log_file.is_open()) {
            while(getline(treated_dns_log_file, current_line)){
                domains.insert(get_domain_from_log_row(current_line));
            }
            
            std::cout << "myset contains:";
            for (const std::string& x: domains) std::cout << " " << x;
            std::cout <<  std::endl;

            treated_dns_log_file.close();
        }
        else{
            cout << "Error opening file" << file_name;
        }
    }

    void Calculate() {
        CalculateNumberOfDigits();
        //cout << number_of_digits << endl;
    }
};