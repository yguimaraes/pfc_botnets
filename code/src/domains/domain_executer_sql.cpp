#include "domain_executer.h"
#include "domain_storage.h"

DomainExecuterSql::DomainExecuterSql(): DomainExecuter(){
	m_storage = new DomainExecuterSql();
};