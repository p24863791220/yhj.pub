
#include "mainwindow.h"
#include <QApplication>
#include "mainwindow2.h"



int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
     MainWindow w;
     MainWindow2 w2;
    w.show();
    QObject::connect(&w,SIGNAL(showmainwindow2()),&w2,SLOT(receiveshoww2()));
    QObject::connect(&w2,SIGNAL(showmainwindow()),&w,SLOT(receiveshoww()));
    return a.exec();
}
