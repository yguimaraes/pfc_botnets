#include "dataloaderworker.h"
#include <iostream>
#include <unistd.h>

DataloaderWorker::DataloaderWorker(QObject *parent) : QObject(parent)
{

}

void DataloaderWorker::loadLog(){
    for( int count = 0; count < 5; count++ )
     {
        usleep( 100000 );
        std::cout << "Ping long!" << std::endl;
        emit progress(count);
     }
}
