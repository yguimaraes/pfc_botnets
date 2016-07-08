// #include "client_manager.h"
#include "query_filter.h"

int main(int argc, char const *argv[]){

    QueryFilter* qf = new QueryFilterSql();
    qf->ProcessLogs();
    delete qf;

    return 0;
}