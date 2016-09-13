#include "logselectorform.h"
#include "ui_logselectorform.h"
#include <QFileDialog>
#include "dataloaderworker.h"
#include <iostream>
#include <QtConcurrent>

LogSelectorForm::LogSelectorForm(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::LogSelectorForm){
    ui->setupUi(this);
    this->ProgressDialog = new QProgressDialog(this);
    connect(&this->FutureWatcher, SIGNAL (finished()), this, SLOT (slot_finished()));
    connect(&this->FutureWatcher, SIGNAL (finished()), this->ProgressDialog, SLOT (cancel()));
}

void LogSelectorForm::slot_finished(){
    std::cout << "Finished" << std::endl;
}

LogSelectorForm::~LogSelectorForm(){
    delete ui;
}

void LogSelectorForm::on_pushButton_clicked(){
    QString filename = QFileDialog::getOpenFileName(
                this,
                tr("Abrir Arquivo"),
                "~/",
                "Arquivo Texto (*.txt)"
                );
    ui->label_filename->setText(filename);
}


void LogSelectorForm::on_pushButton_2_clicked(){
    QFuture<void> future = QtConcurrent::run(&this->MyDataloader, &DataloaderWorker::loadLog);
    this->FutureWatcher.setFuture(future);
    this->ProgressDialog->setMinimum(0);
    this->ProgressDialog->setMaximum(0);
    this->ProgressDialog->setLabelText("Importando logs para o banco de dados...");
    this->ProgressDialog->setWindowModality(Qt::WindowModal);
    this->ProgressDialog->exec();
}
