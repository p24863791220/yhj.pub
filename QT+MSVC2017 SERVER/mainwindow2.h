#ifndef MAINWINDOW2_H
#define MAINWINDOW2_H
#include "mainwindow.h"

#include <QMainWindow>

namespace Ui {
class MainWindow2;
}


class MainWindow2 : public QMainWindow
{
    Q_OBJECT

public: 
    explicit MainWindow2(QWidget *parent = nullptr);
    ~MainWindow2();


signals:
    void showmainwindow();

private slots:
    void on_exitbutton_clicked();
    void  receiveshoww2();

private:
    Ui::MainWindow2 *ui;
    void closeEvent(QCloseEvent *event);
    QStandardItemModel* m_standarditemModel;
    QStandardItemModel *m_standardtableitemodel;
    void loadlistitem();
    void loadtableitem();
};

#endif // MAINWINDOW2_H
