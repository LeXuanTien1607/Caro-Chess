import QtQuick 2.0
import QtQuick.Layouts 1.15
Item {
    id: it1
    width: 640
    height: 500
    visible: true

    Image {
        id: img2
        source: "qrc:/anh-nen-lam-slide_023656040.jpg"
        anchors.fill: parent
        smooth: true

        }
    ColumnLayout {
       anchors {
          top: parent.top;
          horizontalCenter: parent.horizontalCenter
          topMargin: 100
       }
       Button {
          Layout.alignment: Qt.AlignCenter
          Layout.topMargin: 20
          text: "About"
          size: 25
          color: "steelblue"
       }

       Button {
          Layout.alignment: Qt.AlignCenter
          Layout.topMargin: 20
          text: "Game: CaRo Chess \nMentor: Dinh Van Toi \nName: Le Xuan Tien \nAge: 22 \n Company: FSOFT"
          size: 25
          color: "steelblue"
       }
       Button {
          Layout.alignment: Qt.AlignCenter
          Layout.topMargin: 20
          text: "Exit"
          size: 25
          color: "steelblue"
          MouseArea {
             anchors.fill: parent
             onClicked: Controller.return_Main()
          }
       }
    }
}
