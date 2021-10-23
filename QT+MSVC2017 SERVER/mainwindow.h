#ifndef MAINWINDOW_H
#define MAINWINDOW_H
#include<QMessageBox>
#include <QMainWindow>
#include<QTime>
#include<QColumnView>
#include<QStandardItemModel>
#include "mainwindow2.h"
#include<WinSock2.h>
#pragma comment(lib,"ws2_32.lib")
#define WM_SOCK WM_USER+99

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

     //重新paintevent事件，画背景图
    void paintEvent(QPaintEvent *);
    bool nativeEvent(const QByteArray &eventType, void *message, long *result);
signals:
    void sng_txtEdit_txtEdit();
    void showmainwindow2();
private slots:
    void on_pushButton_clicked();

    void on_m_edit_input_textChanged(const QString &arg1);

    void on_pushButton_2_clicked();


    void on_pushButton_4_clicked();
    void receiveshoww();


    void on_b_DialogShow_clicked();
    void on_btn_Clear_clicked();

    void on_pushButton_3_clicked();

private:
    QString getTimeString(){
        QTime time = QTime::currentTime();
        QString str = time.toString("hh:mm:ss");
        return str;
    }
    void dealCommand(SOCKET client);
private:
    Ui::MainWindow *ui ;

    QColumnView *m_columnView ;

     QStandardItemModel *m_standardItemMode ;
    void webserverMain();
    void merror(int,int,char*);
    void sendhtml(SOCKET ,char*);
    void setbackcolor(QPushButton *, QColor);

    SOCKET servSock;
    QMap<SOCKET,sockaddr_in*> mClientMap;
    char mBuf[4096]{0};
    QString mHelp =  "\n帮助菜单：\n"
                     "     help         :显示帮助菜单\n"
                     "     getsysinfo   :获取server主机信息\n"
                     "     swap         :交换鼠标左右键\n"
                     "     restore      :恢复鼠标左右键\n"
                     "     unknown cmd  :将反射回去\n";
};

#endif // MAINWINDOW_H
