#include "controller.h"
#include "qqmlcontext.h"

Controller::Controller(QQmlApplicationEngine &engine)
{
    engine.rootContext()->setContextProperty("_myModel", &Model);
    ctrlEngine = &engine;
}

void Controller::load_About()
{
    emit m_loadAbout("About.qml");
}

void Controller::load_Help()
{
    emit m_loadHelp("Help.qml");
}

void Controller::load_Play()
{
    emit m_loadPlay("Play.qml");
}

void Controller::return_Main()
{
    emit m_returnMain("StartScreen.qml");
}

void Controller::load_Option()
{
    emit m_loadOption("Option.qml");
}

void Controller::reset_Game()
{
    QObject* obj = ctrlEngine->rootObjects().at(0)->findChild<QObject*>("screenLoader");
    if (obj) {
        obj->setProperty("active", false);
        load_Play();
        obj->setProperty("active", true);
    }
    Model.resetBoard();
    emit m_resetGame("Play.qml");

}

void Controller::save_Size(int option_size)
{
    Model.setSize(option_size);
}


void Controller::markCell(int currentIndex, bool player)
{
    int x_cord = currentIndex/Model.size();
    int y_cord = currentIndex%Model.size();
    Model::States currentState = (player == false) ? Model::States::X : Model::States::O;
    QModelIndex currentModelIndex = Model.index(currentIndex);
    Model.setCellData(x_cord, y_cord, currentModelIndex, currentState);
    checkWin(x_cord, y_cord, currentState);
}

void Controller::checkWin(int &x_cord, int &y_cord, Model::States &currentState)
{
    int size = Model.size();
    int offsetDiagonal = abs(x_cord - y_cord);
    int offsetAntiDiagonal = abs((size - 1) - x_cord - y_cord);

    //check row
    int count = 0;
    for (int y = 0; y < size; y++)
    {
        count = (Model.getCellData(x_cord, y) == currentState) ? (count + 1) : 0;
        if (count >= 5) {
            emit winGame();
        }
    }

    //check column
    count = 0;
    for (int x = 0; x < size; x++)
    {
        count = (Model.getCellData(x,y_cord) == currentState) ? (count + 1) : 0;
        if (count >= 5) {
            emit winGame();
        }
    }
    //check diagonal
    count = 0;
    if (y_cord >= x_cord) {
        for (int i = 0; i < size - offsetDiagonal; i++ )
        {
            count = (Model.getCellData(i,i + offsetDiagonal) == currentState) ? (count + 1) : 0;
            if (count >= 5) {
                emit winGame();
            }
        }
    }
    else {
        for (int i = 0; i < size - offsetDiagonal; i++ )
        {
            count = (Model.getCellData(i + offsetDiagonal,i) == currentState) ? (count + 1) : 0;
            if (count >= 5) {
                emit winGame();
            }
        }
    }

    //check anti-diagonal
    count = 0;
    if (x_cord + y_cord > (size - 1)) {
        for (int i = 0; i < size - offsetAntiDiagonal; i++)
        {
            count = (Model.getCellData(size - 1 - i, offsetAntiDiagonal + i) == currentState) ? (count + 1) : 0;
            if (count >= 5) {
                emit winGame();
            }
        }
    }
    else {
        for (int i = 0; i < size - offsetAntiDiagonal; i++)
        {
            count = (Model.getCellData(i, size - offsetAntiDiagonal - 1 - i) == currentState) ? (count + 1) : 0;
            if (count >= 5) {
                emit winGame();
            }
        }
    };
}
