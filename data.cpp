#include "data.h"

Data::Data(QObject *parent)
    : QObject{parent}
{

}

const QString &Data::namePlayX() const
{
    return m_namePlayX;
}

void Data::setNamePlayX(const QString &newNamePlayX)
{
    if (m_namePlayX == newNamePlayX)
        return;
    m_namePlayX = newNamePlayX;
    emit namePlayXChanged();
}

const QString &Data::namePlay0() const
{
    return m_namePlayO;
}

void Data::setNamePlayO(const QString &newNamePlayO)
{
    if (m_namePlayO == newNamePlayO)
        return;
    m_namePlayO = newNamePlayO;
    emit namePlayOChanged();
}

int Data::numberWinX() const
{
    return m_numberWinX;
}

void Data::setnumberWinX(int newNumberWinX)
{
    if (m_numberWinX == newNumberWinX)
        return;
    m_numberWinX = newNumberWinX;
    emit numberWinXChanged();
}

int Data::numberWinO() const
{
    return m_numberWinO;
}

void Data::setnumberWinO(int newNumberWinO)
{
    if (m_numberWinO == newNumberWinO)
        return;
    m_numberWinO = newNumberWinO;
    emit numberWinOChanged();
}
