#include "dataloaderworker.h"
#include <iostream>
#include <unistd.h>
#include "queryfilter.h"
#include "domainexecuter.h"

DataloaderWorker::DataloaderWorker(QObject *parent) : QObject(parent)
{

}

void DataloaderWorker::loadLog(QString filename){
    QueryFilter* qf = new QueryFilter();
    int log_id = qf->NextLogID();
    qf->ProcessLogs(filename, log_id);
    delete qf;
    DomainExecuter* de = new DomainExecuter(log_id);
    de->CalculateDomainDegrees();
    delete de;
}
