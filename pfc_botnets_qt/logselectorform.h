#ifndef LOGSELECTORFORM_H
#define LOGSELECTORFORM_H

#include <QWidget>
#include <QFutureWatcher>
#include <QProgressDialog>
#include "dataloaderworker.h"
#include <QThread>

namespace Ui {
class LogSelectorForm;
}

class LogSelectorForm : public QWidget
{
    Q_OBJECT
public slots:
    void slot_finished();
public:
    explicit LogSelectorForm(QWidget *parent = 0);
    ~LogSelectorForm();

private slots:
    void on_pushButton_clicked();

    void on_btn_load_clicked();

    void on_conf_button_clicked();

    void on_plot_button_clicked();

    void on_cluster_button_clicked();

private:
    void check_config();

    Ui::LogSelectorForm *ui;
    QFutureWatcher<void> FutureWatcher;
    QProgressDialog* ProgressDialog;
    DataloaderWorker MyDataloader;
};

#endif // LOGSELECTORFORM_H
