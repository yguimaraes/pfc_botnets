#ifndef DOMAINEXECUTER_H
#define DOMAINEXECUTER_H

#include "domainstorage.h"

using namespace std;

class DomainExecuter {
protected:
    DomainStorage* m_domain_storage;
public:
    DomainExecuter();

    ~DomainExecuter();

    void CalculateDomainDegrees();
};
#endif // DOMAINEXECUTER_H
