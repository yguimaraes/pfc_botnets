#ifndef QUERYFILTER_H
#define QUERYFILTER_H

#include "querystorage.h"
#include <QString>

class QueryFilter
{
protected:
    QueryStorage* m_storage;
public:
    void ProcessLogs(QString filename);

    QueryFilter();

    ~QueryFilter();
};

#endif // QUERYFILTER_H
