#-------------------------------------------------
#
# Project created by QtCreator 2016-08-04T15:56:03
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = pfc_botnets_qt
TEMPLATE = app


SOURCES += main.cpp\
        logselectorform.cpp \
    dataloader.cpp

HEADERS  += logselectorform.h \
    dataloader.h

FORMS    += logselectorform.ui
