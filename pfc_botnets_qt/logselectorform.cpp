#include "logselectorform.h"
#include "ui_logselectorform.h"
#include <QFileDialog>
#include "dataloaderworker.h"
#include <iostream>
#include <QtConcurrent>
#include "configdialog.h"
#include "plotdialog.h"

LogSelectorForm::LogSelectorForm(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::LogSelectorForm){
    ui->setupUi(this);
    connect(&this->FutureWatcher, SIGNAL (finished()), this, SLOT (slot_finished()));
}

void LogSelectorForm::slot_finished(){
    //std::cout << "Finished" << std::endl;
    ui->btn_load->setEnabled(true);
    ui->cluster_button->setEnabled(true);
    ui->plot_button->setEnabled(true);
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
    this->ProgressDialog->setCancelButton(0);
    this->ProgressDialog->setLabelText("Importando logs para o banco de dados...");
    this->ProgressDialog->setWindowModality(Qt::WindowModal);
    this->ProgressDialog->exec();
}

void LogSelectorForm::on_conf_button_clicked(){
    ConfigDialog config_dialog;
    config_dialog.setModal(true);
    config_dialog.exec();
}

void LogSelectorForm::on_plot_button_clicked(){
    PlotDialog plot_dialog;
    plot_dialog.exec();
}

void LogSelectorForm::check_config(){
    QString conf_path = QStandardPaths::writableLocation(QStandardPaths::AppConfigLocation).append("/config.json");

    QFile f(conf_path);

    if (!f.exists()){
        QDir().mkpath(QStandardPaths::writableLocation(QStandardPaths::AppConfigLocation));
        QJsonValue algorithm("KMeans");
        QJsonObject param = QJsonObject();
        param.insert("n_clusters",4);
        QJsonArray features;
        features.append(QString("count_domain_with_numbers"));
        features.append(QString("average_domain_length"));
        features.append(QString("std_domain_length"));
        features.append(QString("count_request"));
        features.append(QString("average_requisition_degree"));
        features.append(QString("std_requisition_degree"));
        features.append(QString("minimum_requisition_degree"));
        QJsonObject target = QJsonObject();
        target.insert("algorithm",algorithm);
        target.insert("features",features);
        target.insert("param",param);
        QJsonDocument config_out(target);
        QFile out_file(QStandardPaths::writableLocation(QStandardPaths::AppConfigLocation).append("/config.json"));
        out_file.open(QIODevice::WriteOnly | QIODevice::Text);
        out_file.write(config_out.toJson());
        out_file.close();
    }
}

void LogSelectorForm::on_cluster_button_clicked(){
    QString config_path = QStandardPaths::writableLocation(QStandardPaths::AppConfigLocation);
    QString filename = QFileDialog::getSaveFileName(
                this,
                tr("Salvar Arquivo"),
                "~/",
                "Planilha (*.xls)"
                );
    check_config();
    QStringList params, env;
    QProcess *graph = new QProcess(this);
    params << "../code/python/smallest_cluster.py";
    params << config_path + "/config.json";
    params << config_path + "/log_id.json";
    params << filename;
    graph->startDetached("python",params);
    graph->waitForFinished(-1);
}
