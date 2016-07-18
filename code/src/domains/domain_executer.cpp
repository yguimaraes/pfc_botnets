#include "domain_executer.h"

void DomainExecuter::CalculateDomainDegrees(){
    m_domain_storage->updateAllDegrees();
}

DomainExecuter::~DomainExecuter(){
    delete m_domain_storage;
}

DomainExecuter::DomainExecuter(){}