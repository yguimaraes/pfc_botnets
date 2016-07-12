#pragma once

#include "domain_storage.h"

class DomainFilter{
protected:
    DomainStorage* m_storage;
public:

    void ProcessLogs();

    DomainFilter();

    ~DomainFilter();
};

class DomainFilterSql: public DomainFilter{
public:
    DomainFilterSql();
};


class DomainFilterFile: public DomainFilter{};