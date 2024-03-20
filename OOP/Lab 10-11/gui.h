#pragma once
#include <bits/stdc++.h>
#include <QWidget>
#include <QTableView>
#include <QVBoxLayout>
#include <QHBoxLayout>
#include <QPushButton>
#include <QTableWidget>
#include <QHeaderView>
#include <QListWidget>
#include <QFormLayout>
#include <QLabel>
#include <QLineEdit>
#include <QGridLayout>
using namespace std;

#include "service.h"
#include "observer.h"
#include "tabel.h"


class gui:public Observer{
private:

    StudentService& sServ;

    QWidget *window, *rgtBox, *forms, *btns;
    QVBoxLayout  *rgtBoxLayout;
    QHBoxLayout *windowLayout;
    QGridLayout *gridBtnsLayout;
    QFormLayout *formsLayout;

    MyTableModel *model;
    QTableView* table;
    QLabel *lbId, *lbNume, *lbVarsta, *lbFacultate;
    QLineEdit *txtId, *txtNume, *txtVarsta, *txtFacultate;
    QPushButton *intinerireBtn, *imbatranireBtn, *btnUndo, *btnRedo, *btnPop;




public:

    gui(StudentService& sServ): sServ{sServ}{
        init_GUI();
        init_connect();
        table->setModel(model);
        loadData(sServ.getAllStudents());
    }

    void init_GUI(){
        window = new QWidget();
        window->setWindowTitle("Studenti");
        windowLayout = new QHBoxLayout;

        table = new QTableView;
        model = new MyTableModel(sServ.getAllStudents());

        windowLayout->addWidget(table);


        rgtBox = new QWidget();
        rgtBoxLayout = new QVBoxLayout();

        forms = new QWidget();
        formsLayout = new QFormLayout();
        lbId = new QLabel("NrMatricol");
        txtId = new QLineEdit;
        formsLayout->addRow(lbId, txtId);
        lbNume = new QLabel("Nume");
        txtNume = new QLineEdit;
        formsLayout->addRow(lbNume, txtNume);
        lbVarsta = new QLabel("Varsta");
        txtVarsta = new QLineEdit;
        formsLayout->addRow(lbVarsta, txtVarsta);
        lbFacultate = new QLabel("Facultate");
        txtFacultate = new QLineEdit;
        formsLayout->addRow(lbFacultate, txtFacultate);
        forms->setLayout(formsLayout);

        btns = new QWidget();
        gridBtnsLayout = new QGridLayout();
        intinerireBtn = new QPushButton("&intinerire");
        gridBtnsLayout->addWidget(intinerireBtn, 0, 0);
        imbatranireBtn = new QPushButton("&imbatranire");
        gridBtnsLayout->addWidget(imbatranireBtn, 0, 1);
        btnPop = new QPushButton("&Sterge");
        gridBtnsLayout->addWidget(btnPop, 0, 2);
        btnUndo = new QPushButton("&Undo");
        gridBtnsLayout->addWidget(btnUndo, 1, 0);
        btnRedo= new QPushButton("&Redo");
        gridBtnsLayout->addWidget(btnRedo, 1, 1);

        btns->setLayout(gridBtnsLayout);

        rgtBoxLayout->addWidget(forms);
        rgtBoxLayout->addWidget(btns);
        rgtBoxLayout->addStretch();
        rgtBox->setLayout(rgtBoxLayout);


        windowLayout->addWidget(rgtBox);

        window->setLayout(windowLayout);

    }

    void loadData(vector<Student> students){
        model->setStudents(students);

    }

    void update() override{
        loadData(sServ.getAllStudents());
    }

    void init_connect(){
        QObject::connect(table, &QTableView::clicked, [this]() {
            if (table->selectionModel()->selectedIndexes().isEmpty()) {
                txtId->setText("");
                txtNume->setText("");
                txtVarsta->setText("");
                txtFacultate->setText("");
                return;
            }
            int selRow = table->selectionModel()->selectedIndexes().at(0).row();
            qDebug() << selRow;
            txtId->setText(table->model()->data(table->model()->index(selRow, 0), Qt::DisplayRole).toString());
            txtNume->setText(table->model()->data(table->model()->index(selRow, 1), Qt::DisplayRole).toString());
            txtVarsta->setText(table->model()->data(table->model()->index(selRow, 2), Qt::DisplayRole).toString());
            txtFacultate->setText(table->model()->data(table->model()->index(selRow, 3), Qt::DisplayRole).toString());
        });


        QObject::connect(btnPop, &QPushButton::clicked, [&]() {
            const string id = txtId->text().toStdString();
            int id2 = stoi(id);
            sServ.removeStudent(id2);
            txtId->clear();
            txtNume->clear();
            txtVarsta->clear();
            txtFacultate->clear();
            loadData(sServ.getAllStudents());
        });

        QObject::connect(intinerireBtn, &QPushButton::clicked, [&]() {
            sServ.intinerire();
            loadData(sServ.getAllStudents());
        });

        QObject::connect(imbatranireBtn, &QPushButton::clicked, [&]() {
            sServ.imbatranire();
            loadData(sServ.getAllStudents());
        });


    }

    void show(){
        window->show();
    }

};


