#include "mainwindow2.h"
#include "ui_mainwindow2.h"
#include "mainwindow.h"
#include <QCloseEvent>
#include<qlistview.h>
#include"QStandardItem"

MainWindow2::MainWindow2(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow2)
{
    ui->setupUi(this);   
//    loadlistitem();
//    loadtableitem();
    //connect(ui->exitbutton,SIGNAL(clicked()),this,SLOT(close2()));
}

MainWindow2::~MainWindow2()
{
    delete ui;
}

void MainWindow2::on_exitbutton_clicked()
{
    this->hide();
    emit showmainwindow();
}
void MainWindow2::receiveshoww2()
{
    loadlistitem();
    loadtableitem();
    this->show();
}
void MainWindow2::closeEvent(QCloseEvent *event)
{
    switch( QMessageBox::information(this,tr("提示"),tr("返回主页?"),tr("确定"), tr("取消"),0,1))
    {
    case 0:
        //event->accept();
        this->hide();
        emit showmainwindow();
        break;
    case 1:
    default:
        event->ignore();
        break;
    }
}
void MainWindow2::loadlistitem()
{
    m_standarditemModel=new QStandardItemModel(this);
    QStringList strList;
    strList.append("string1");
    strList.append("string2");
    strList.append("string3");
    strList.append("string4");
    strList.append("string5");
    strList.append("string6");
    strList.append("string7");
    strList<<"string8";
    strList+="string9";
    int nCount=strList.size();
    for (int i=0;i<nCount;i++)
    {
        QString string=static_cast<QString>(strList.at(i));
        QStandardItem *item=new QStandardItem(string);
        if(i%2==1)
        {
            QLinearGradient linearGrad(QPointF(0,0),QPointF(200,200));
            linearGrad.setColorAt(0,Qt::white);
            linearGrad.setColorAt(1,Qt::blue);
            QBrush brush(linearGrad);
            item->setBackground(brush);
            item->setSizeHint(QSize(200,30));
        }
        else
        {
            //QBrush brush(Qt::green);
            item->setBackground(Qt::green);
            item->setSizeHint((QSize(200,20)));
            item->setEditable(false);
        }
        m_standarditemModel->appendRow((item));
    }
     ui->listView->setModel(m_standarditemModel);
    ui->listView->setFixedSize(200,300);

}
void MainWindow2::loadtableitem()
{
    m_standardtableitemodel=new QStandardItemModel(4,2);
    ui->tableView->setModel(m_standardtableitemodel);
    m_standardtableitemodel->setHeaderData(0,Qt::Horizontal,tr("label"));
    m_standardtableitemodel->setHeaderData(1,Qt::Horizontal,tr("Quantity"));
    for(int row=0;row<4;++row)
    {
        for(int column=0;column<2;++column)
        {
            QModelIndex index=m_standardtableitemodel->index(row,column,QModelIndex());
            m_standardtableitemodel->setData(index,QVariant((row+1)*(column+1)));
        }
    }
    //this->setCentralWidget(ui->tableView);
}
