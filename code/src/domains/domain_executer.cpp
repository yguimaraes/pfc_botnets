#include "domain_executer.h"

void DomainExecuter::CalculateDomainDegrees(){
    printf("CalculateDomainDegrees\n");
    m_domain_storage->updateAllDegrees();
}

DomainExecuter::~DomainExecuter(){
    delete m_domain_storage;
}

DomainExecuter::DomainExecuter(){}