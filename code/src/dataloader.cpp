#include "client_executer.h"
#include "query_filter.h"

int main(int argc, char const *argv[]){

    QueryFilter* qf = new QueryFilterSql();
    qf->ProcessLogs();
    delete qf;
    ClientExecuter* ce = new ClientExecuter("sql");
    ce->update();
    delete ce;
    return 0;
}