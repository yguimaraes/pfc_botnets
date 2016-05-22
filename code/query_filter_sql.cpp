#include "query_filter.h"
#include "storages/query_storage_sql.h"

class QueryFilterSql: public QueryFilter{
public:
    QueryFilterSql(): QueryFilter(){
    	m_storage = new QueryStorageSQL();
    };
};

int main() {
	QueryFilter* qf = new QueryFilterSql();
	qf->ProcessLogs();
	delete qf;
	return 0;
}