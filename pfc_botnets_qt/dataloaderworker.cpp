#include "dataloaderworker.h"
#include <iostream>
#include <unistd.h>
#include "queryfilter.h"
#include "domainexecuter.h"

DataloaderWorker::DataloaderWorker(QObject *parent) : QObject(parent)
{

}

void DataloaderWorker::loadLog(){
    QueryFilter* qf = new QueryFilter();
    qf->ProcessLogs();
    delete qf;
    DomainExecuter* de = new DomainExecuter();
    de->CalculateDomainDegrees();
    delete de;
}
