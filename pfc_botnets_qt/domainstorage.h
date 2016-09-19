#ifndef DOMAINSTORAGE_H
#define DOMAINSTORAGE_H

#include "dnsquery.h"
#include <libpq-fe.h>

class DomainStorage
{
private:
    PGconn* m_connection;
    int m_log_id;
public:
    DomainStorage(int log_id);
    ~DomainStorage();
    void updateAllDegrees();
};

#endif // DOMAINSTORAGE_H
