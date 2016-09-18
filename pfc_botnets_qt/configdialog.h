#ifndef CONFIGDIALOG_H
#define CONFIGDIALOG_H

#include <QDialog>
#include <map>
#include <QString>
#include <QCheckBox>

namespace Ui {
class ConfigDialog;
}

class ConfigDialog : public QDialog
{
    Q_OBJECT

public:
    explicit ConfigDialog(QWidget *parent = 0);
    ~ConfigDialog();

private slots:

    void on_buttonBox_accepted();

private:
    Ui::ConfigDialog *ui;
    std::map<QString,QCheckBox*> mapCheckBox;
};

#endif // CONFIGDIALOG_H
