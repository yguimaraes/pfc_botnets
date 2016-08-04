#ifndef LOGSELECTORFORM_H
#define LOGSELECTORFORM_H

#include <QWidget>

namespace Ui {
class LogSelectorForm;
}

class LogSelectorForm : public QWidget
{
    Q_OBJECT

public:
    explicit LogSelectorForm(QWidget *parent = 0);
    ~LogSelectorForm();

private slots:
    void on_pushButton_clicked();

    void on_pushButton_2_clicked();

private:
    Ui::LogSelectorForm *ui;
};

#endif // LOGSELECTORFORM_H
