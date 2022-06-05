#include "model.h"

Model::Model(QObject *parent)
    : QAbstractListModel{parent}
{
}

int Model::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    int count = (m_board.size())*(m_board[0].size());
    return count;
}
QVariant Model::data(const QModelIndex &index, int role) const

{
    int x_cord = index.row()/m_board.size();
    int y_cord = index.row()%m_board.size();
    if (!index.isValid()) {
        return QVariant();
    }
    if (role == Qt::DisplayRole)
    {
        int data = m_board[x_cord][y_cord];
        return data;
    }
    else {
        return QVariant();
    }
}

int Model::size()
{
    return m_board.size();
}

void Model::resetBoard()
    {
        for (auto &cell : m_board) {
            fill(cell.begin(), cell.end(), States::NUL);
        }
    }
Model::States Model::getCellData(int x_cord, int y_cord)
{
    return m_board[x_cord][y_cord];
}

void Model::setCellData(int x_cord, int y_cord, QModelIndex currentModelIndex, States currentState)
{
    m_board[x_cord][y_cord] = currentState;
    emit dataChanged(currentModelIndex, currentModelIndex);
}

void Model::setSize(int option_size)
{
    m_board.resize(option_size);
    for (int i = 0; i < option_size; ++i)
        m_board[i].resize(option_size);
    for (auto &cell : m_board) {
        fill(cell.begin(), cell.end(), States::NUL);}
}
