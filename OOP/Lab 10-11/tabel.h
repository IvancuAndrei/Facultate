#include <QAbstractTableModel>
#include <QBrush>
#include <Qt>
#include <QFont>
#include "domain.h"
#include <vector>
#include <qdebug.h>
#include <QAbstractTableModel>
#include <QBrush>
#include <Qt>
#include <QFont>
#include <vector>
#include <qdebug.h>

using std::vector;

class MyTableModel :public QAbstractTableModel {
private:
    vector<Student> oList;

public:
    MyTableModel(const std::vector<Student>& oList) :oList{ oList } {
    }

    int rowCount(const QModelIndex& parent = QModelIndex()) const override {
        return oList.size();
    }

    int columnCount(const QModelIndex& parent = QModelIndex()) const override {
        return 5;
    }

    QVariant data(const QModelIndex& index, int role = Qt::DisplayRole) const {
        if (role == Qt::DisplayRole) {
            Student student = oList[index.row()];
            if (index.column() == 0)
                return QString::number(student.getNrMatricol());
            else if (index.column() == 1)
                return QString::fromStdString(student.getNume());
            else if (index.column() == 2)
                return QString::number(student.getVarsta());
            else if (index.column() == 3)
                return QString::fromStdString(student.getFacultate());
        }

        return QVariant();
    }

    void setStudents(const vector<Student> oList) {
        this->oList = oList;
        auto topLeft = createIndex(0, 0);
        auto bottomR = createIndex(rowCount(), columnCount());
        //emit countChanged();
        emit dataChanged(topLeft, bottomR);
    }
};