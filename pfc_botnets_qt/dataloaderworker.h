#ifndef DATALOADERWORKER_H
#define DATALOADERWORKER_H

#include <QObject>
#include <QString>

class DataloaderWorker : public QObject
{
    Q_OBJECT
public:
    explicit DataloaderWorker(QObject *parent = 0);
    void loadLog();
signals:
    void progress(int);
public slots:
};

#endif // DATALOADERWORKER_H
