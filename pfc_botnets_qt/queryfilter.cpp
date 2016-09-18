#include "queryfilter.h"
#include "queryexecuter.h"

void QueryFilter::ProcessLogs(QString filename, int log_id){
    QueryExecuter query_executer(filename.toStdString(), m_storage, log_id);
    query_executer.ProcessDnsLog();
}

int QueryFilter::NextLogID()
{
    return m_storage->MaxLogID() + 1;
}

QueryFilter::~QueryFilter(){
    delete m_storage;
}

QueryFilter::QueryFilter(){
    m_storage = new QueryStorage();
}
