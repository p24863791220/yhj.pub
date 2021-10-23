#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "mainwindow2.h"
#include <Windows.h>
#include <QDebug>
#include<QPainter>
#include <QStringList>
#include<QColumnView>
#include<QStandardItemModel>
#include<stdio.h>


MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{

    ui->setupUi(this);
    //主场景设置
     setFixedSize(800,800);
    setWindowIcon(QIcon("图标资源1/artsbuilder.ico"));
    setWindowTitle("qt开发的程序");
    connect(ui->actionexit,&QAction::triggered,[=](){this->close();});

      m_standardItemMode=new QStandardItemModel(this);
    QStringList strList;
    strList.append("string1");
     strList.append("string2");
      strList.append("string3");
       strList.append("string4");
        strList.append("string5");
         strList.append("string6");
          strList.append("string7");
          strList<<"string8";strList+="string9";
          int nCount=strList.size();
    for (int i=0;i<nCount;i++)
    {
        QString string=static_cast<QString>(strList.at(i));
        QStandardItem *item=new QStandardItem(string);
        m_standardItemMode->appendRow(item);

    }
    ui->columnView2->setModel(m_standardItemMode);
   //m_columnView->setModel(m_standardItemMode);
   //m_columnView->setFixedSize(100,300);
}
void MainWindow:: paintEvent(QPaintEvent *)
{
    QPainter painter(this);
    QPixmap pix;
    pix.load("图标资源1/back.jpg");
    painter.drawPixmap(0,0,this->width(),this->height(), pix);



}
MainWindow::~MainWindow()
{
    //释放与客户端的连接
    for(QMap<SOCKET,sockaddr_in*>::iterator it = mClientMap.begin();it != mClientMap.end();it++){
        delete it.value();
        closesocket(it.key());
    }
    closesocket(servSock);
    delete ui;
    //winsocket 清理
    WSACleanup();

}


void MainWindow::on_pushButton_clicked()
{
    connect(ui->m_edit_input,SIGNAL(textChanged(const QString&)),ui->m_edit_output,SLOT(setText(const QString&)));
    connect(ui->m_edit_input,SIGNAL(textChanged(const QString&)),ui->m_edit_output2,SLOT(setText(const QString&)));
     connect(ui->m_edit_input,SIGNAL(textChanged(const QString&)),ui->textEdit_2,SLOT(setText(const QString&)));
     connect(ui->m_edit_input,SIGNAL(textChanged(const QString&)),ui->textEdit,SLOT(setText(const QString&)));
        qDebug("x:pushbutton");


}

void MainWindow::on_m_edit_input_textChanged(const QString &arg1)
{
    //ui->m_edit_output->setText(ui->m_edit_input->text());
}

void MainWindow::on_pushButton_2_clicked()
{

   // disconnect(m_edit_input,0,0,0);
    ui->m_edit_input->disconnect(ui->textEdit);
   // ui->m_edit_input->disconnect(SIGNAL( textChanged(const QString&)));

}


void MainWindow::on_pushButton_4_clicked()
{
    this->hide();
    emit showmainwindow2();
}
void MainWindow::receiveshoww()
{
    this->show();
}

void MainWindow::on_b_DialogShow_clicked()
{

    //ui->b_DialogShow->hide();
    webserverMain();
}
void MainWindow:: merror(int redata,int error,char*  showinfo)
{
   if  (redata==error)
   {
       qDebug(showinfo);
      //perror(showinfo);
   }
}
void MainWindow::sendhtml(SOCKET cs,char* filename)
{
    FILE *pfile=fopen(filename,"r");
    if (pfile==NULL)
    {
        qDebug()<<"openfile failed";
        return;
    }
    char temp[1024];
    do
    {
      fgets(temp,1024,pfile);
      send(cs,temp,strlen(temp),0);
    }while(!feof(pfile));

}
void MainWindow:: webserverMain()
{
    //perror("webserver启动中...");
    //QMessageBox::information(this,tr("提示"),tr("webserver启动中..."),tr("确定"), tr("取消"),0,1);
    //初始化 DLL
       WSADATA wsData;
      int isok= WSAStartup( MAKEWORD(2, 2), &wsData);
         merror(isok,WSAEINVAL,(char*)"申请socket失败");
       //创建套接字
       servSock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
         merror(servSock,(int)INVALID_SOCKET,(char*)"创建socket失败");
       //绑定套接字
      struct sockaddr_in sockAddr;
      // memset(&sockAddr, 0, sizeof(sockAddr));  //每个字节都用0填充
       sockAddr.sin_family = AF_INET;  //使用IPv4地址
       sockAddr.sin_addr.s_addr =INADDR_ANY; // inet_addr("127.0.0.1");  //具体的IP地址
       sockAddr.sin_port = htons(80);  //端口
      isok= bind(servSock, (SOCKADDR*)&sockAddr, sizeof(sockAddr));
        merror(isok,SOCKET_ERROR,(char*)"绑定失败");
       //进入监听状态
       listen(servSock, 5);
       //设置mListen为非阻塞模式,应用程序只对FD_ACCEPT感兴趣（有新的socket进行连接，当此事件发生，调用accept函数时为非阻塞直接返回了）
       WSAAsyncSelect(servSock,(HWND)winId(),WM_SOCK,FD_ACCEPT);

       //以下是同步发送网页或文字,阻塞不好用；
//       //接收客户端请求
//       struct sockaddr clntAddr;
//       int nSize = sizeof(clntAddr);
//       while(1)
//       {

//           SOCKET clntSock = accept(servSock, (SOCKADDR*)&clntAddr, &nSize);
//            merror(clntSock,(int)INVALID_SOCKET,(char*)"连接失败");
////           //向客户端发送数据
////           char *str =(char *) "Hello World!";
////           send(clntSock, str, strlen(str)+sizeof(char), null);
//            char revdata[1024]="";
//           recv(clntSock,revdata,1024,0);
//            qDebug() <<revdata;
//            //发送文字
////           char* sendata =(char*)"<h1 style=\"color:red\">海军,您好<h1>";
////           send(clntSock,sendata,strlen(sendata),0);
//            //发送网页
//            sendhtml (clntSock,(char*)"jswebsoket.html");
//           //关闭套接字
//           closesocket(clntSock);
//       }

//       closesocket(servSock);

//       //终止 DLL 的使用
//       WSACleanup();
}
bool MainWindow::nativeEvent(const QByteArray &eventType, void *message, long *result)
{
    MSG* msg = (MSG*)message;
    switch(msg->message)
    {
    case WM_SOCK:
        //发生错误统一处理
        if(WSAGETSELECTERROR(msg->lParam)){
            qDebug() << "发生错误";
            break;
        }
        switch (WSAGETSELECTEVENT(msg->lParam))
        {
            case FD_ACCEPT:
                {
                    qDebug() << "有新的客户端进行连接";

                   struct sockaddr_in  *addr = new sockaddr_in;//传出参数
                    int len;//传出参数
                    SOCKET client =  accept(servSock,(sockaddr*)addr,&len);
                    //通信套接字 对read和close感兴趣
                    WSAAsyncSelect(client,(HWND)winId(),WM_SOCK,FD_READ | FD_CLOSE);

                    //给客户端发送菜单信息
//                    char* ch = mHelp.toUtf8().data();
//                    send(client,ch,strlen(ch)+1,0);
                    sendhtml(client,(char*)"jswebsoket.html");

                    char* ipStr = inet_ntoa(addr->sin_addr);
                    int port = ntohs(addr->sin_port);
                    ui->listWidget->insertItem(0,QString("%1 [%2:%3] 连接成功").arg(this->getTimeString()).arg(QString(ipStr)).arg(port));
                    //保存到全局对象中
                    mClientMap.insert(client,addr);
                    //设定连接颜色
//                    ui->b_DialogShow->setStyleSheet("background-color::green()");
//                    ui->b_DialogShow->setStyleSheet("color::black()");
                    setbackcolor(ui->b_DialogShow,Qt::green);
                }
                break;
            case FD_READ:
                {
                    memset(mBuf,0,4096);
                    SOCKET client = (SOCKET)msg->wParam;
                    sockaddr_in *addr = mClientMap.find(client).value();//msg->wParam保存的是发生网络事件的套接字
                    char* ipStr = inet_ntoa(addr->sin_addr);
                    int port = ntohs(addr->sin_port);
                    recv(client,mBuf,4096,0);

                    dealCommand(client);
                    ui->listWidget->insertItem(0,QString("%1 [%2:%3]:%4").arg(this->getTimeString()).arg(ipStr).arg(port).arg(mBuf));
                }
                break;
            case FD_CLOSE:
                qDebug() << "客户端断开连接";
                SOCKET client = (SOCKET)msg->wParam;
                sockaddr_in *addr = mClientMap.find(client).value();//msg->wParam保存的是发生网络事件的套接字
                closesocket(client);
                mClientMap.remove(client);

                char* ipStr = inet_ntoa(addr->sin_addr);
                int port = ntohs(addr->sin_port);
                ui->listWidget->insertItem(0,QString("%1 [%2:%3] 断开连接").arg(this->getTimeString()).arg(ipStr).arg(port));
                setbackcolor(ui->b_DialogShow,Qt::gray);
                break;
        }
    }
    //其他交给qt处理
  // return MainWindow::nativeEvent(eventType, message, result);
  return false;

}
void MainWindow::setbackcolor(QPushButton *q,QColor c)
{
    //设置按钮背景色
    QPalette palette = q->palette();
    palette.setColor(QPalette::Button,c);
    q->setPalette(palette);
    q->setAutoFillBackground(true);
    q->setFlat(true);
}
//处理 客户端发送过来的命令
void MainWindow::dealCommand(SOCKET client){
    if(QString(mBuf).compare("help") == 0){
        char* ch = mHelp.toUtf8().data();
        send(client,ch,strlen(ch)+1,0);
    }else if(QString(mBuf).compare("swap") == 0){
        //SwapMouseButton(true);
        char* ch = (char *)"swap命令执行成功";
        send(client,ch,strlen(ch)+1,0);
    }else if(QString(mBuf).compare("restore") == 0 ){
       // SwapMouseButton(false);
        char* ch = (char *)"restore命令执行成功";
        send(client,ch,strlen(ch)+1,0);
    }else if(QString(mBuf).compare("getsysinfo") == 0){
        char buf[1024]{0};
        DWORD nsize;
        //GetComputerNameA(buf,&nsize);
        QString info("\ncomputer name:%1\nuser name:%2\n");
        //info  = info.arg(QString("计算机"));
        info  = info.arg(QString(buf));
        memset(buf,0,1024);
        //GetUserNameA(buf,&nsize);
        //info = info.arg(QString(buf));
        info = info.arg(QString("名称"));
        char* ch = info.toUtf8().data();
        send(client,ch,strlen(ch)+1,0);
    }else{
        //未知命令 回射回去
        send(client,mBuf,strlen(mBuf)+1,0);
    }
    return;
}

void MainWindow::on_btn_Clear_clicked()
{
    ui->listWidget->clear();
}

void MainWindow::on_pushButton_3_clicked()
{
    //关机或重启
    system("shutdown -r -t 08");

//    关机指令。（shutdown -s -t xx）
//    重启指令。（shutdown -r -t xx）
//    注销指令。（shutdown -l -t xx）
}
