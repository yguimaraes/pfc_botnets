#include "query_filter.h"
#include "storages/query_storage_sql.cpp"

class QueryFilterSql: public QueryFilter{
public:
    QueryFilterSql(string path): QueryFilter(path){
    	m_storage = QueryStorageSQL();
    };

protected:
	void save(raw_fields query_data){

	}
};