#ifndef PLOTDIALOG_H
#define PLOTDIALOG_H

#include <QDialog>

namespace Ui {
class PlotDialog;
}

class PlotDialog : public QDialog
{
    Q_OBJECT

public:
    explicit PlotDialog(QWidget *parent = 0);
    ~PlotDialog();

private slots:

    void on_pushButton_clicked();

private:
    Ui::PlotDialog *ui;
};

#endif // PLOTDIALOG_H
