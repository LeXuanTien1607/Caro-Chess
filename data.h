#ifndef DATA_H
#define DATA_H
#include "qtmetamacros.h"
#include <QObject>

class Data : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString namePlayX READ namePlayX WRITE setNamePlayX NOTIFY namePlayXChanged)
    Q_PROPERTY(QString namePlayO READ namePlay0 WRITE setNamePlayO NOTIFY namePlayOChanged)
    Q_PROPERTY(int numberWinX READ numberWinX WRITE setnumberWinX NOTIFY numberWinXChanged)
    Q_PROPERTY(int numberWinO READ numberWinO WRITE setnumberWinO NOTIFY numberWinOChanged)

public:
    explicit Data(QObject *parent = nullptr);

    const QString &namePlayX() const;
    void setNamePlayX(const QString &newNamePlayX);

    const QString &namePlay0() const;
    void setNamePlayO(const QString &newNamePlayO);

    int numberWinX() const;
    void setnumberWinX(int newNumberWinX);

    int numberWinO() const;
    void setnumberWinO(int newNumberWinO);

signals:
    void namePlayXChanged();

    void namePlayOChanged();

    void numberWinXChanged();

    void numberWinOChanged();

private:
    QString m_namePlayX;

    QString m_namePlayO;

    int m_numberWinX = 0;

    int m_numberWinO = 0;
};
#endif // DATA_H
