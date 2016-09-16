#ifndef DOMAINSTORAGE_H
#define DOMAINSTORAGE_H

#include "dnsquery.h"
#include <libpq-fe.h>

class DomainStorage
{
private:
    PGconn* m_connection;
public:
    DomainStorage();
    ~DomainStorage();
    void updateAllDegrees();
};

#endif // DOMAINSTORAGE_H
