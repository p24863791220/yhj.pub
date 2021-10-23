/********************************************************************************
** Form generated from reading UI file 'mainwindow.ui'
**
** Created by: Qt User Interface Compiler version 5.14.2
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MAINWINDOW_H
#define UI_MAINWINDOW_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QColumnView>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QListView>
#include <QtWidgets/QListWidget>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenu>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QScrollBar>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QTextEdit>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QAction *actionopen;
    QAction *actionsave;
    QAction *actionexit;
    QAction *actionabout_me;
    QWidget *centralwidget;
    QListView *listView;
    QTextEdit *textEdit;
    QLineEdit *m_edit_input;
    QLineEdit *m_edit_output;
    QPushButton *pushButton;
    QPushButton *pushButton_2;
    QScrollBar *horizontalScrollBar;
    QLineEdit *m_edit_output2;
    QTextEdit *textEdit_2;
    QColumnView *columnView2;
    QPushButton *pushButton_4;
    QPushButton *b_DialogShow;
    QListWidget *listWidget;
    QPushButton *btn_Clear;
    QPushButton *pushButton_3;
    QMenuBar *menubar;
    QMenu *menu;
    QMenu *menu_2;
    QStatusBar *statusbar;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName(QString::fromUtf8("MainWindow"));
        MainWindow->resize(800, 600);
        actionopen = new QAction(MainWindow);
        actionopen->setObjectName(QString::fromUtf8("actionopen"));
        actionsave = new QAction(MainWindow);
        actionsave->setObjectName(QString::fromUtf8("actionsave"));
        actionexit = new QAction(MainWindow);
        actionexit->setObjectName(QString::fromUtf8("actionexit"));
        actionabout_me = new QAction(MainWindow);
        actionabout_me->setObjectName(QString::fromUtf8("actionabout_me"));
        centralwidget = new QWidget(MainWindow);
        centralwidget->setObjectName(QString::fromUtf8("centralwidget"));
        listView = new QListView(centralwidget);
        listView->setObjectName(QString::fromUtf8("listView"));
        listView->setGeometry(QRect(670, 330, 121, 191));
        textEdit = new QTextEdit(centralwidget);
        textEdit->setObjectName(QString::fromUtf8("textEdit"));
        textEdit->setGeometry(QRect(30, 100, 104, 71));
        m_edit_input = new QLineEdit(centralwidget);
        m_edit_input->setObjectName(QString::fromUtf8("m_edit_input"));
        m_edit_input->setGeometry(QRect(30, 210, 113, 20));
        m_edit_output = new QLineEdit(centralwidget);
        m_edit_output->setObjectName(QString::fromUtf8("m_edit_output"));
        m_edit_output->setGeometry(QRect(200, 210, 113, 20));
        pushButton = new QPushButton(centralwidget);
        pushButton->setObjectName(QString::fromUtf8("pushButton"));
        pushButton->setGeometry(QRect(30, 250, 75, 23));
        pushButton->setCheckable(false);
        pushButton_2 = new QPushButton(centralwidget);
        pushButton_2->setObjectName(QString::fromUtf8("pushButton_2"));
        pushButton_2->setGeometry(QRect(200, 250, 75, 23));
        horizontalScrollBar = new QScrollBar(centralwidget);
        horizontalScrollBar->setObjectName(QString::fromUtf8("horizontalScrollBar"));
        horizontalScrollBar->setGeometry(QRect(250, 530, 521, 16));
        horizontalScrollBar->setOrientation(Qt::Horizontal);
        m_edit_output2 = new QLineEdit(centralwidget);
        m_edit_output2->setObjectName(QString::fromUtf8("m_edit_output2"));
        m_edit_output2->setGeometry(QRect(200, 170, 113, 20));
        textEdit_2 = new QTextEdit(centralwidget);
        textEdit_2->setObjectName(QString::fromUtf8("textEdit_2"));
        textEdit_2->setGeometry(QRect(200, 60, 104, 71));
        columnView2 = new QColumnView(centralwidget);
        columnView2->setObjectName(QString::fromUtf8("columnView2"));
        columnView2->setGeometry(QRect(30, 280, 161, 191));
        pushButton_4 = new QPushButton(centralwidget);
        pushButton_4->setObjectName(QString::fromUtf8("pushButton_4"));
        pushButton_4->setGeometry(QRect(30, 500, 75, 23));
        b_DialogShow = new QPushButton(centralwidget);
        b_DialogShow->setObjectName(QString::fromUtf8("b_DialogShow"));
        b_DialogShow->setGeometry(QRect(120, 500, 91, 23));
        listWidget = new QListWidget(centralwidget);
        listWidget->setObjectName(QString::fromUtf8("listWidget"));
        listWidget->setGeometry(QRect(320, 10, 341, 511));
        btn_Clear = new QPushButton(centralwidget);
        btn_Clear->setObjectName(QString::fromUtf8("btn_Clear"));
        btn_Clear->setGeometry(QRect(670, 290, 75, 23));
        pushButton_3 = new QPushButton(centralwidget);
        pushButton_3->setObjectName(QString::fromUtf8("pushButton_3"));
        pushButton_3->setGeometry(QRect(30, 20, 75, 23));
        MainWindow->setCentralWidget(centralwidget);
        menubar = new QMenuBar(MainWindow);
        menubar->setObjectName(QString::fromUtf8("menubar"));
        menubar->setGeometry(QRect(0, 0, 800, 23));
        menu = new QMenu(menubar);
        menu->setObjectName(QString::fromUtf8("menu"));
        menu_2 = new QMenu(menubar);
        menu_2->setObjectName(QString::fromUtf8("menu_2"));
        MainWindow->setMenuBar(menubar);
        statusbar = new QStatusBar(MainWindow);
        statusbar->setObjectName(QString::fromUtf8("statusbar"));
        MainWindow->setStatusBar(statusbar);

        menubar->addAction(menu->menuAction());
        menubar->addAction(menu_2->menuAction());
        menu->addAction(actionopen);
        menu->addAction(actionsave);
        menu->addAction(actionexit);
        menu_2->addAction(actionabout_me);

        retranslateUi(MainWindow);

        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QCoreApplication::translate("MainWindow", "MainWindow", nullptr));
        actionopen->setText(QCoreApplication::translate("MainWindow", "open", nullptr));
        actionsave->setText(QCoreApplication::translate("MainWindow", "save", nullptr));
        actionexit->setText(QCoreApplication::translate("MainWindow", "exit", nullptr));
        actionabout_me->setText(QCoreApplication::translate("MainWindow", "about me", nullptr));
        pushButton->setText(QCoreApplication::translate("MainWindow", "connect", nullptr));
        pushButton_2->setText(QCoreApplication::translate("MainWindow", "disconnect", nullptr));
        pushButton_4->setText(QCoreApplication::translate("MainWindow", "\347\252\227\344\275\2232", nullptr));
        b_DialogShow->setText(QCoreApplication::translate("MainWindow", "webServer\345\220\257\345\212\250", nullptr));
        btn_Clear->setText(QCoreApplication::translate("MainWindow", "\346\270\205\347\251\272list", nullptr));
        pushButton_3->setText(QCoreApplication::translate("MainWindow", "\351\207\215\345\220\257\347\224\265\350\204\221", nullptr));
        menu->setTitle(QCoreApplication::translate("MainWindow", "\346\226\207\344\273\266", nullptr));
        menu_2->setTitle(QCoreApplication::translate("MainWindow", "\345\270\256\345\212\251", nullptr));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
