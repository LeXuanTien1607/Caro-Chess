#ifndef MODEL_H
#define MODEL_H
#include <QtCore>
#include <QtGui>
#include <cstring>
#include <QAbstractListModel>
#include <cmath>
#include <vector>
#include <iostream>
using namespace std;

class Model : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(int size READ size WRITE setSize NOTIFY sizeChanged)
public:
    explicit Model(QObject *parent = nullptr);
    enum States {X, O, NUL};
    virtual int rowCount(const QModelIndex &parent) const override; //return number of elements
    virtual QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override; //
    int size();
    void setSize(int size);
    void resetBoard();
    States getCellData(int x_cord, int y_cord);
    void setCellData(int x_cord, int y_cord, QModelIndex currentModelIndex, States currentState);
signals:
    void sizeChanged(int size);
private:
    vector<vector<States>> m_board;
};
#endif // Model
