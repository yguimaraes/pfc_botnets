#pragma once

#include "domain_storage.h"

using namespace std;

class DomainExecuter {
    DomainStorage* domain_storage;
public:
    DomainExecuter(DomainStorage* qs);

    ~DomainExecuter();

	void CalcuteDomainDegrees();
};