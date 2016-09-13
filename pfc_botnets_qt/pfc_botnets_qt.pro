#-------------------------------------------------
#
# Project created by QtCreator 2016-08-04T15:56:03
#
#-------------------------------------------------

QT       += core gui concurrent

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = pfc_botnets_qt
TEMPLATE = app

INCLUDEPATH += /usr/local/Cellar/postgresql/9.5.0/include \
               /usr/local/Cellar/boost/1.60.0_1/include
LIBS += -L/usr/local/lib -lpq -lboost_system -lboost_filesystem

SOURCES += main.cpp\
        logselectorform.cpp \
    dataloaderworker.cpp \
    queryfilter.cpp \
    querystorage.cpp \
    dnsquery.cpp \
    queryexecuter.cpp \
    domainfeaturescalculator.cpp \
    domainexecuter.cpp \
    domainstorage.cpp

HEADERS  += logselectorform.h \
    dataloaderworker.h \
    queryfilter.h \
    querystorage.h \
    dnsquery.h \
    queryexecuter.h \
    domainfeaturescalculator.h \
    domainexecuter.h \
    domainstorage.h

FORMS    += logselectorform.ui
