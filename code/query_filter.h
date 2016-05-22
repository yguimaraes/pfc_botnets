#include "query_executer.cpp"

class QueryFilter{
    QueryStorage* m_storage;
public:
    void ProcessLogs(){
        QueryExecuter query_executer("path", m_storage);
        query_executer.ProcessDnsLog();
    }

    ~QueryFilter(){
        delete m_storage;
    }
};

class QueryFilterFile: public QueryFilter{
};