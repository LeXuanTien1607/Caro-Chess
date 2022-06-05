#ifndef CONTROLLER_H
#define CONTROLLER_H
#include <QObject>
#include "qtmetamacros.h"
#include <cstring>
#include <QAbstractListModel>
#include <QtCore>
#include "model.h"
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "data.h"
class Controller : public QObject
{
    Q_OBJECT;
public:
    Controller(QQmlApplicationEngine &engine);
    Q_INVOKABLE void load_About();
    Q_INVOKABLE void load_Help();
    Q_INVOKABLE void return_Main();
    Q_INVOKABLE void load_Play();
    Q_INVOKABLE void reset_Game();
    Q_INVOKABLE void load_Option();
    Q_INVOKABLE void save_Size(int option_size);

    Q_INVOKABLE void markCell(int currentIndex, bool player);
    void checkWin(int &x_cord, int &y_cord, Model::States &currentState);
    QQmlApplicationEngine* ctrlEngine;
private:
    Model Model;
    Data Data;
signals:
    void m_loadAbout (QString source1);
    void m_loadHelp (QString source2);
    void m_returnMain (QString source3);
    void m_loadPlay (QString source4);
    void m_resetGame (QString source5);
    void m_loadOption (QString source6);
    void winGame();
};
#endif // CONTROLLER_H
