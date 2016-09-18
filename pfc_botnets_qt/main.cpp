#include "logselectorform.h"
#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    LogSelectorForm w;
    w.show();

    return a.exec();
}
