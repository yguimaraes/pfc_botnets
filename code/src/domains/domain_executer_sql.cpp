#include "domain_executer_sql.h"
#include "domain_storage.h"

DomainExecuterSql::DomainExecuterSql(): DomainExecuter(){
	m_domain_storage = new DomainStorageSql();
};