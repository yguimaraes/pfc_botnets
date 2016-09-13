#ifndef QUERYFILTER_H
#define QUERYFILTER_H

#include "querystorage.h"

class QueryFilter
{
protected:
    QueryStorage* m_storage;
public:
    void ProcessLogs();

    QueryFilter();

    ~QueryFilter();
};

#endif // QUERYFILTER_H
