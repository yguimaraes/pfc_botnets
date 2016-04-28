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

    int CalculateNumberOfDigits(string domain) {
        int number_of_digits = 0;
        for(string::iterator it=domain.begin(); it!=domain.end(); ++it) {
            if(*it >= '0' && *it <= '9')
                number_of_digits+=1;
        }
        cout << domain << " " << number_of_digits << endl;
        return number_of_digits;
    }

    int IsSufixSuspect(string domain){
        size_t found = domain.find_last_of(".");
        string sufix = domain.substr(found+1);
        cout << sufix << " ";
        return 0;
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
            treated_dns_log_file.close();
        }
        else{
            cout << "Error opening file" << file_name;
        }
    }

    void Calculate() {
        ofstream domains_data("dominios.csv");
        for (const std::string& domain: domains) {
            int is_sufix_suspect = IsSufixSuspect(domain);
            int number_of_digits = CalculateNumberOfDigits(domain);
            domains_data << domain << "," << is_sufix_suspect << "," << number_of_digits << endl;
        }; 
        domains_data.close();
    }
};