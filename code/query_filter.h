#include "query_executer.cpp"

class QueryFilter{
protected:
    QueryStorage* m_storage;
public:

    void ProcessLogs(){
        QueryExecuter query_executer("samples/20120223-log-dns-ime.txt", m_storage);
        query_executer.ProcessDnsLog();
    }

    ~QueryFilter(){
        delete m_storage;
    }
};

class QueryFilterFile: public QueryFilter{
};