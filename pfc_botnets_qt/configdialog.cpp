#include "configdialog.h"
#include "ui_configdialog.h"
#include <QFile>
#include <QStandardPaths>
#include <QJsonDocument>
#include <QJsonValue>
#include <QJsonArray>
#include <QJsonObject>
#include <QDir>

ConfigDialog::ConfigDialog(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::ConfigDialog),
    mapCheckBox(std::map<QString,QCheckBox*>())
{
    ui->setupUi(this);

    mapCheckBox[QString("count_domain_with_numbers")] = ui->count_domain_with_numbers;
    mapCheckBox[QString("average_domain_length")] = ui->average_domain_length;
    mapCheckBox[QString("std_domain_length")] = ui->std_domain_length;
    mapCheckBox[QString("average_request_interval")] = ui->average_request_interval;
    mapCheckBox[QString("std_request_interval")] = ui->std_request_interval;
    mapCheckBox[QString("count_request")] = ui->count_request;
    mapCheckBox[QString("count_request_not_in_whitelist")] = ui->count_request_not_in_whitelist;
    mapCheckBox[QString("average_requisition_degree")] = ui->average_requisition_degree;
    mapCheckBox[QString("std_requisition_degree")] = ui->std_requisition_degree;
    mapCheckBox[QString("minimum_requisition_degree")] = ui->minimum_requisition_degree;
    mapCheckBox[QString("count_request_cname")] = ui->count_request_cname;
    mapCheckBox[QString("percentage_request_cname")] = ui->percentage_request_cname;
    mapCheckBox[QString("count_request_a")] = ui->count_request_a;
    mapCheckBox[QString("percentage_request_a")] = ui->percentage_request_a;
    mapCheckBox[QString("count_request_mx")] = ui->count_request_mx;
    mapCheckBox[QString("percentage_request_mx")] = ui->percentage_request_mx;
    mapCheckBox[QString("count_request_txt")] = ui->count_request_txt;
    mapCheckBox[QString("percentage_request_txt")] = ui->percentage_request_txt;

    QFile file(QStandardPaths::writableLocation(QStandardPaths::AppConfigLocation).append("/config.json"));
    file.open(QIODevice::ReadOnly | QIODevice::Text);
    QJsonDocument d = QJsonDocument::fromJson(file.readAll());
    QJsonObject config_json = d.object();

    if (config_json.empty()) {
        ui->k_means->setChecked(true);
        ui->spinBox->setValue(4);
        ui->count_domain_with_numbers->setChecked(true);
        ui->average_domain_length->setChecked(true);
        ui->std_domain_length->setChecked(true);
        ui->count_request->setChecked(true);
        ui->average_requisition_degree->setChecked(true);
        ui->std_requisition_degree->setChecked(true);
        ui->minimum_requisition_degree->setChecked(true);

        QDir().mkpath(QStandardPaths::writableLocation(QStandardPaths::AppConfigLocation));

    } else {
        file.close();

        // Set algorithm
        ui->k_means->setChecked(config_json.value(QString("algorithm")) == QJsonValue("KMeans"));
        ui->agglo_clust->setChecked(config_json.value(QString("algorithm")) == QJsonValue("AgglomerativeClustering"));

        // Set features
        QJsonArray feat = config_json["features"].toArray();
        for (int i = 0; i < feat.size(); i++){
            mapCheckBox[feat[i].toString()]->setChecked(true);
        }

        // Set n_clusters
        ui->spinBox->setValue(config_json["param"].toObject()["n_clusters"].toInt());
    }
}

ConfigDialog::~ConfigDialog()
{
    delete ui;
}

void ConfigDialog::on_buttonBox_accepted(){
    QFile::remove(QStandardPaths::writableLocation(QStandardPaths::AppConfigLocation).append("/config.json"));

    QJsonArray features;
    QJsonValue algorithm(ui->k_means->isChecked() ? "KMeans" : "AgglomerativeClustering");
    QJsonObject param = QJsonObject();
    param.insert("n_clusters",QJsonValue(ui->spinBox->value()));
    for (std::map<QString,QCheckBox*>::iterator it = mapCheckBox.begin(); it != mapCheckBox.end(); it++){
        if (it->second->isChecked()){
            features.append(it->first);
        }
    }
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
