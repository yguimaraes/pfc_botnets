#include <iostream>
#include <fstream>
#include "domainfeaturescalculator.h"
#include <QString>
#include <QFile>
using namespace std;

void DomainFeaturesCalculator::populate(FILE_TYPE var) {
    string line, file_name;
    unordered_set<string> *variable;
    switch (var){
        case prefix_file:
            file_name = "config_files/lista_tld.txt";
            variable = &prefix;
            break;
        case white_list_file:
            file_name = "config_files/whitelist_dom.txt";
            variable = &white_list;
            break;
        case dictionary_file:
            file_name = "config_files/dicionario.txt";
            variable = &dictionary;
            break;
    }
    QFile file(QString::fromStdString(file_name));
    if (file.isOpen()){
        while (!file.atEnd()){
            variable->insert(file.readLine().toStdString());
        }
    }
    else{
        cerr << "Sorry, we can't provide you our data" << endl << "To reference your own data, change " << var << "method on domain_features_calculator.cpp" << endl;
    }
}

bool DomainFeaturesCalculator::isSufixSuspect(){
    size_t found = domain_name.find_last_of(".");
    string sufix = domain_name.substr(found+1);
    // cout << sufix << " ";
    return false;
}

string DomainFeaturesCalculator::getDomain(){
    return domain_name;
}

int DomainFeaturesCalculator::CalculateNumberOfDigits() {
    int number_of_digits = 0;
    for(string::iterator it=domain_name.begin(); it!=domain_name.end(); ++it) {
        if(*it >= '0' && *it <= '9')
            number_of_digits+=1;
    }
    // cout << domain_name << " " << number_of_digits << endl;
    return number_of_digits;
}

int DomainFeaturesCalculator::ReadableStringLength(){
    QString qs_domain_without_dots =  QString::fromStdString(domain_name);
    qs_domain_without_dots.remove(QChar('.'), Qt::CaseInsensitive);
    string domain_without_dots = qs_domain_without_dots.toStdString();
    //boost::erase_all(domain_without_dots, ".");
    int domain_length = domain_without_dots.length();

    int biggest_readable = 0;
    string part_domain;
    if (dictionary.empty()){
        populate(dictionary_file);
    }

    for (int i = 0; i < domain_length; i++){
        for (int j = biggest_readable+1; j <= domain_length - i; j++){ // Parte do maior já encontrado
                                                                       // Não esquecer de checar isso quando modificar
            part_domain = domain_without_dots.substr(i,j);

            if (dictionary.count(part_domain) > 0){
                // cout << part_domain << endl;
                biggest_readable = part_domain.length();
            }
        }
    }

    return biggest_readable;
}

bool DomainFeaturesCalculator::isDomainSuspicious() {
    //whitelist alexia;
    return 0;
}

int DomainFeaturesCalculator::CalculateDomainLength(){
    return domain_name.length();
}

bool DomainFeaturesCalculator::isInWhiteList(){
    if (white_list.empty()){
        populate(white_list_file);
    }
    return white_list.count(domain_name) > 0;
}

unordered_set<string> DomainFeaturesCalculator::prefix;
unordered_set<string> DomainFeaturesCalculator::white_list;
unordered_set<string> DomainFeaturesCalculator::dictionary;
