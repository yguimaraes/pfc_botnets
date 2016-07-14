#pragma once

#include "domain_storage.h"

using namespace std;

class DomainExecuter {
protected:
    DomainStorage* m_domain_storage;
public:
    DomainExecuter();

    ~DomainExecuter();

	void CalculateDomainDegrees();
};