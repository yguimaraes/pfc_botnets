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
#include <QtWidgets/QFormLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_LogSelectorForm
{
public:
    QFormLayout *formLayout;
    QLabel *label;
    QPushButton *pushButton;
    QPushButton *btn_load;
    QLabel *label_filename;
    QLabel *label_file_status;

    void setupUi(QWidget *LogSelectorForm)
    {
        if (LogSelectorForm->objectName().isEmpty())
            LogSelectorForm->setObjectName(QStringLiteral("LogSelectorForm"));
        LogSelectorForm->resize(362, 408);
        formLayout = new QFormLayout(LogSelectorForm);
        formLayout->setSpacing(6);
        formLayout->setContentsMargins(11, 11, 11, 11);
        formLayout->setObjectName(QStringLiteral("formLayout"));
        label = new QLabel(LogSelectorForm);
        label->setObjectName(QStringLiteral("label"));

        formLayout->setWidget(0, QFormLayout::LabelRole, label);

        pushButton = new QPushButton(LogSelectorForm);
        pushButton->setObjectName(QStringLiteral("pushButton"));

        formLayout->setWidget(0, QFormLayout::FieldRole, pushButton);

        btn_load = new QPushButton(LogSelectorForm);
        btn_load->setObjectName(QStringLiteral("btn_load"));
        btn_load->setEnabled(false);

        formLayout->setWidget(2, QFormLayout::SpanningRole, btn_load);

        label_filename = new QLabel(LogSelectorForm);
        label_filename->setObjectName(QStringLiteral("label_filename"));

        formLayout->setWidget(1, QFormLayout::SpanningRole, label_filename);

        label_file_status = new QLabel(LogSelectorForm);
        label_file_status->setObjectName(QStringLiteral("label_file_status"));

        formLayout->setWidget(3, QFormLayout::SpanningRole, label_file_status);


        retranslateUi(LogSelectorForm);

        QMetaObject::connectSlotsByName(LogSelectorForm);
    } // setupUi

    void retranslateUi(QWidget *LogSelectorForm)
    {
        LogSelectorForm->setWindowTitle(QApplication::translate("LogSelectorForm", "LogSelectorForm", 0));
        label->setText(QApplication::translate("LogSelectorForm", "Escolha o arquivo de Log DNS:", 0));
        pushButton->setText(QApplication::translate("LogSelectorForm", "Escolher Arquivo", 0));
        btn_load->setText(QApplication::translate("LogSelectorForm", "Carregar", 0));
        label_filename->setText(QApplication::translate("LogSelectorForm", "Nenhum Arquivo Selecionado", 0));
        label_file_status->setText(QApplication::translate("LogSelectorForm", "Arquivo n\303\243o carregado.", 0));
    } // retranslateUi

};

namespace Ui {
    class LogSelectorForm: public Ui_LogSelectorForm {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_LOGSELECTORFORM_H
