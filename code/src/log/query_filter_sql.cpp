#include "query_filter.h"
#include "query_storage.h"


QueryFilterSql::QueryFilterSql(): QueryFilter(){
	m_storage = new QueryStorageSql();
};