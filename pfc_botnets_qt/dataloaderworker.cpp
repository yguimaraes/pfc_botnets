#include "dataloaderworker.h"
#include <iostream>
#include <unistd.h>
#include "queryfilter.h"
#include "domainexecuter.h"
#include <QFile>
#include <QStandardPaths>
#include <QJsonDocument>
#include <QJsonValue>
#include <QJsonArray>
#include <QJsonObject>
#include <QDir>

DataloaderWorker::DataloaderWorker(QObject *parent) : QObject(parent)
{

}

void DataloaderWorker::loadLog(QString filename){
    QueryFilter* qf = new QueryFilter();
    int log_id = qf->NextLogID();
    saveLogId(log_id);
    qf->ProcessLogs(filename, log_id);
    delete qf;
    DomainExecuter* de = new DomainExecuter(log_id);
    de->CalculateDomainDegrees();
    delete de;
}

void DataloaderWorker::saveLogId(int log_id){
    QFile::remove(QStandardPaths::writableLocation(QStandardPaths::AppConfigLocation).append("/log_id.json"));
    QJsonValue log(log_id);
    QJsonObject target = QJsonObject();
    target.insert("log_id",log);
    QJsonDocument config_out(target);
    QFile out_file(QStandardPaths::writableLocation(QStandardPaths::AppConfigLocation).append("/log_id.json"));
    out_file.open(QIODevice::WriteOnly | QIODevice::Text);
    out_file.write(config_out.toJson());
    out_file.close();
}
