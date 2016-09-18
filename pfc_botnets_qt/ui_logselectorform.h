/********************************************************************************
** Form generated from reading UI file 'logselectorform.ui'
**
** Created by: Qt User Interface Compiler version 5.7.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_LOGSELECTORFORM_H
#define UI_LOGSELECTORFORM_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_LogSelectorForm
{
public:
    QLabel *label;
    QLabel *label_filename;
    QPushButton *pushButton;
    QPushButton *pushButton_2;
    QLabel *label_2;

    void setupUi(QWidget *LogSelectorForm)
    {
        if (LogSelectorForm->objectName().isEmpty())
            LogSelectorForm->setObjectName(QStringLiteral("LogSelectorForm"));
        LogSelectorForm->resize(824, 408);
        label = new QLabel(LogSelectorForm);
        label->setObjectName(QStringLiteral("label"));
        label->setGeometry(QRect(10, 10, 211, 16));
        label_filename = new QLabel(LogSelectorForm);
        label_filename->setObjectName(QStringLiteral("label_filename"));
        label_filename->setGeometry(QRect(10, 40, 801, 16));
        pushButton = new QPushButton(LogSelectorForm);
        pushButton->setObjectName(QStringLiteral("pushButton"));
        pushButton->setGeometry(QRect(210, 0, 151, 32));
        pushButton_2 = new QPushButton(LogSelectorForm);
        pushButton_2->setObjectName(QStringLiteral("pushButton_2"));
        pushButton_2->setGeometry(QRect(10, 60, 115, 32));
        label_2 = new QLabel(LogSelectorForm);
        label_2->setObjectName(QStringLiteral("label_2"));
        label_2->setGeometry(QRect(30, 100, 541, 16));

        retranslateUi(LogSelectorForm);

        QMetaObject::connectSlotsByName(LogSelectorForm);
    } // setupUi

    void retranslateUi(QWidget *LogSelectorForm)
    {
        LogSelectorForm->setWindowTitle(QApplication::translate("LogSelectorForm", "LogSelectorForm", 0));
        label->setText(QApplication::translate("LogSelectorForm", "Escolha o arquivo de Log DNS", 0));
        label_filename->setText(QApplication::translate("LogSelectorForm", "Nenhum Arquivo Selecionado", 0));
        pushButton->setText(QApplication::translate("LogSelectorForm", "Escolher Arquivo", 0));
        pushButton_2->setText(QApplication::translate("LogSelectorForm", "Carregar", 0));
        label_2->setText(QApplication::translate("LogSelectorForm", "Arquivo n\303\243o carregado.", 0));
    } // retranslateUi

};

namespace Ui {
    class LogSelectorForm: public Ui_LogSelectorForm {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_LOGSELECTORFORM_H
