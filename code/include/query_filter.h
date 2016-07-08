#pragma once

#include "query_storage.h"

class QueryFilter{
protected:
    QueryStorage* m_storage;
public:

    void ProcessLogs();

    QueryFilter();

    ~QueryFilter();
};

class QueryFilterSql: public QueryFilter{
public:
    QueryFilterSql();
};


class QueryFilterFile: public QueryFilter{};