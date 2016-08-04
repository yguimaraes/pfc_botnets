#include "logselectorform.h"
#include "ui_logselectorform.h"
#include <QFileDialog>
#include "dataloader.h"

LogSelectorForm::LogSelectorForm(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::LogSelectorForm)
{
    ui->setupUi(this);
}

LogSelectorForm::~LogSelectorForm()
{
    delete ui;
}

void LogSelectorForm::on_pushButton_clicked()
{
    QString filename = QFileDialog::getOpenFileName(
                this,
                tr("Abrir Arquivo"),
                "~/",
                "Arquivo Texto (*.txt)"
                );
    ui->label_filename->setText(filename);
}


void LogSelectorForm::on_pushButton_2_clicked()
{
    Dataloader dataloader;
    ui->label_2->setText(dataloader.loadLog());
}
