#ifndef QUERYEXECUTER_H
#define QUERYEXECUTER_H

#include <string>
#include <fstream>
#include <unordered_set>
#include "querystorage.h"

using namespace std;

class QueryExecuter {
    ifstream dns_log_file;
    QueryStorage* query_storage;
    unordered_set<string> whitelist;
    string m_path;
    int m_log_id;
public:
    QueryExecuter(string path, QueryStorage* qs, int log_id);

    ~QueryExecuter();

    void ProcessDnsLog();
};

#endif // QUERYEXECUTER_H
