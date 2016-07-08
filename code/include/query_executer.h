#pragma once

#include <string>
#include <fstream>
#include <unordered_set>
#include "query_storage.h"


using namespace std;

class QueryExecuter {
    ifstream dns_log_file;
    QueryStorage* query_storage;
    unordered_set<string> whitelist;
public:
    QueryExecuter(string path, QueryStorage* qs);

    ~QueryExecuter();

	void ProcessDnsLog();
};