#include "client_executer.h"
#include "query_filter.h"
#include "domain_executer.h"
#include "domain_executer_sql.h"

int main(int argc, char const *argv[]){

    QueryFilter* qf = new QueryFilterSql();
    qf->ProcessLogs();
    delete qf;
    DomainExecuter* de = new DomainExecuterSql();
    de->CalculateDomainDegrees();
    delete de;
    ClientExecuter* ce = new ClientExecuter("sql");
    ce->update();
    delete ce;
    return 0;
}