#include <QApplication>
#include "gui.h"


int main(int argc, char *argv[]) {
    QApplication a(argc, argv);

    StudentRepository repo{"students.txt"};
    StudentService service{repo};
    gui GUI{service};
    service.addObserver(&GUI);
    GUI.show();



    return QApplication::exec();
}
