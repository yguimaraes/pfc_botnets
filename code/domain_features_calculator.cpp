using namespace std;
#include <iostream>
#include <cstdlib>
#include <fstream>
#include <unordered_set>
#include <list>
#include <vector>   
#include <boost/algorithm/string.hpp>

class DomainFeaturesCalculator{
    string domain_name;

public:
    DomainFeaturesCalculator(string domain_name) : domain_name(domain_name){}

    bool isSufixSuspect(string domain){
        size_t found = domain.find_last_of(".");
        string sufix = domain.substr(found+1);
        cout << sufix << " ";
        return false;
    }

    string getDomain(){
        return domain_name;
    }

    int CalculateNumberOfDigits() {
        int number_of_digits = 0;
        for(string::iterator it=domain_name.begin(); it!=domain_name.end(); ++it) {
            if(*it >= '0' && *it <= '9')
                number_of_digits+=1;
        }
        cout << domain_name << " " << number_of_digits << endl;
        return number_of_digits;
    }

    int ReadableStringLength(string domain){
        // TODO
        return 0;
    }

    bool isDomainSuspicious() {
        //whitelist alexia;
        return 0;
    }

    int CalculateDomainLength(){
        // TODO
        return 0;
    }

    bool isInWhiteList(){
        // TODO
        return false;
    }
    
};