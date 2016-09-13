#ifndef DOMAINFEATURESCALCULATOR_H
#define DOMAINFEATURESCALCULATOR_H

#include <unordered_set>
#include <vector>
#include <boost/algorithm/string.hpp>

using namespace std;

typedef vector< boost::iterator_range<string::iterator> > find_vector_type;

enum FILE_TYPE {prefix_file, white_list_file, dictionary_file};

class DomainFeaturesCalculator{
    string domain_name;
    static unordered_set<string> prefix;
    static unordered_set<string> white_list;
    static unordered_set<string> dictionary;
    static void populate(FILE_TYPE var);

public:
    DomainFeaturesCalculator(string domain_name) : domain_name(domain_name){}

    bool isSufixSuspect();

    string getDomain();

    int CalculateNumberOfDigits();

    int ReadableStringLength();

    bool isDomainSuspicious();

    int CalculateDomainLength();

    bool isInWhiteList();

};

#endif // DOMAINFEATURESCALCULATOR_H
