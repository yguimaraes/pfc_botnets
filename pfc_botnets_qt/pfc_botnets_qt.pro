#-------------------------------------------------
#
# Project created by QtCreator 2016-08-04T15:56:03
#
#-------------------------------------------------

QT       += core gui concurrent

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = pfc_botnets_qt
TEMPLATE = app

INCLUDEPATH += /usr/local/Cellar/postgresql/9.5.4/include
LIBS += -L "/usr/local/Cellar/postgresql/9.5.4/lib" -lpq

SOURCES += main.cpp\
        logselectorform.cpp \
    dataloaderworker.cpp \
    queryfilter.cpp \
    querystorage.cpp \
    dnsquery.cpp \
    queryexecuter.cpp \
    domainfeaturescalculator.cpp \
    domainexecuter.cpp \
    domainstorage.cpp \
    configdialog.cpp \
    plotdialog.cpp

HEADERS  += logselectorform.h \
    dataloaderworker.h \
    queryfilter.h \
    querystorage.h \
    dnsquery.h \
    queryexecuter.h \
    domainfeaturescalculator.h \
    domainexecuter.h \
    domainstorage.h \
    configdialog.h \
    plotdialog.h

FORMS    += logselectorform.ui \
    configdialog.ui \
    plotdialog.ui

DISTFILES +=
