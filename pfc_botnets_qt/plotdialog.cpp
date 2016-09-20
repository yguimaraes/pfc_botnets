#include "plotdialog.h"
#include "ui_plotdialog.h"

#include <iostream>
#include <string>
#include <QMessageBox>
#include <QProcess>
#include <stdlib.h>
#include <QStandardPaths>

PlotDialog::PlotDialog(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::PlotDialog)
{
    ui->setupUi(this);
}

PlotDialog::~PlotDialog()
{
    delete ui;
}

void PlotDialog::on_pushButton_clicked(){
    int count = 0;
    QStringList params, env;
    QProcess *graph = new QProcess(this);
    params << "../code/python/plot.py";
    env << "PYTHONPATH=/usr/lib/python2.7/site-packages:/usr/local/lib/python2.7/site-packages:/usr/local/lib/python2.7/dist-packages";

    graph->setEnvironment(env);

    if(ui->average_domain_length->isChecked()){
        count++;
         params << "average_domain_length";
    }
    if(ui->average_request_interval->isChecked()){
        count++;
         params << "average_request_interval";
    }
    if(ui->average_requisition_degree->isChecked()){
        count++;
         params << "average_requisition_degree";
    }
    if(ui->count_domain_with_numbers->isChecked()){
        count++;
         params << "count_domain_with_numbers";
    }
    if(ui->count_request->isChecked()){
        count++;
         params << "count_request";
    }
    if(ui->count_request_a->isChecked()){
        count++;
         params << "count_request_a";
    }
    if(ui->count_request_cname->isChecked()){
        count++;
         params << "count_request_cname";
    }
    if(ui->count_request_mx->isChecked()){
        count++;
         params << "count_request_mx";
    }
    if(ui->count_request_not_in_whitelist->isChecked()){
        count++;
         params << "count_request_not_in_whitelist";
    }
    if(ui->count_request_txt->isChecked()){
        count++;
         params << "count_request_txt";
    }
    if(ui->minimum_requisition_degree->isChecked()){
        count++;
         params << "minimum_requisition_degree";
    }
    if(ui->percentage_request_a->isChecked()){
        count++;
         params << "percentage_request_a";
    }
    if(ui->percentage_request_cname->isChecked()){
        count++;
         params << "percentage_request_cname";
    }
    if(ui->percentage_request_mx->isChecked()){
        count++;
         params << "percentage_request_mx";
    }
    if(ui->percentage_request_txt->isChecked()){
        count++;
         params << "percentage_request_txt";
    }
    if(ui->std_domain_length->isChecked()){
        count++;
         params << "std_domain_length";
    }
    if(ui->std_request_interval->isChecked()){
        count++;
         params << "std_request_interval";
    }
    if(ui->std_requisition_degree->isChecked()){
        count++;
         params << "std_requisition_degree";
    }
    if(count < 2 || count > 3){
        QMessageBox::information(this,tr("Erro"),tr("Quantidade selecionada não é válida"));
    }
    graph->startDetached("python", params);
    graph->waitForFinished(-1);
}
