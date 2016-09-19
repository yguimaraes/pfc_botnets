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
    connect(&this->FutureWatcher, SIGNAL (finished()), this, SLOT (slot_finished()));
}

void LogSelectorForm::slot_finished(){
    //std::cout << "Finished" << std::endl;
    ui->btn_load->setEnabled(true);
    ui->label_file_status->setText("Arquivo de Logs Carregado com Sucesso!");
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
    ui->btn_load->setEnabled(true);
}

void LogSelectorForm::on_btn_load_clicked()
{
    ui->btn_load->setEnabled(false);
    QFuture<void> future = QtConcurrent::run(&this->MyDataloader, &DataloaderWorker::loadLog, ui->label_filename->text());
    this->FutureWatcher.setFuture(future);
    this->ProgressDialog = new QProgressDialog(this);
    connect(&this->FutureWatcher, SIGNAL (finished()), this->ProgressDialog, SLOT (cancel()));
    this->ProgressDialog->setMinimum(0);
    this->ProgressDialog->setMaximum(0);
    this->ProgressDialog->setLabelText("Importando logs para o banco de dados...");
    this->ProgressDialog->setWindowModality(Qt::WindowModal);
    this->ProgressDialog->exec();
}
