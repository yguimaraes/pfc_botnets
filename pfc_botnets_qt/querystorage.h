#ifndef QUERYSTORAGE_H
#define QUERYSTORAGE_H

#include "dnsquery.h"
#include <libpq-fe.h>

class QueryStorage
{
    PGconn* m_connection;
    int m_log_id;
public:
    void save(DnsQuery query, int log_id);

    void addDomain(string domain);

    bool containsDomain(string domain);

    void addClient(string client_ip);

    bool containsClient(string client_ip);

    int MaxLogID();

    string BoolToString(bool m_boolean);

    QueryStorage();

    ~QueryStorage();
};

#endif // QUERYSTORAGE_H
