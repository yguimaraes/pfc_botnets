#ifndef QUERYSTORAGE_H
#define QUERYSTORAGE_H

#include "dnsquery.h"
#include <libpq-fe.h>

class QueryStorage
{
    PGconn* m_connection;
public:
    void save(DnsQuery query);

    void addDomain(string domain);

    bool containsDomain(string domain);

    void addClient(string client_ip);

    bool containsClient(string client_ip);

    string BoolToString(bool m_boolean);

    QueryStorage();

    ~QueryStorage();
};

#endif // QUERYSTORAGE_H
