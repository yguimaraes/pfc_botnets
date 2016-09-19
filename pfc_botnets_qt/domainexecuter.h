#ifndef DOMAINEXECUTER_H
#define DOMAINEXECUTER_H

#include "domainstorage.h"

using namespace std;

class DomainExecuter {
protected:
    DomainStorage* m_domain_storage;
    int m_log_id;
public:
    DomainExecuter(int log_id);

    ~DomainExecuter();

    void CalculateDomainDegrees();
};
#endif // DOMAINEXECUTER_H
