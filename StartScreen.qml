import QtQuick 2.0
import QtQuick.Layouts 1.15
import QtMultimedia 5.6
Item {
    id: it1
    width: 512
    height: 512
    visible: true
    Image {
        id: img1
        source: "qrc:/36517357_470663520058575_2261193972313489408_n.png"
        anchors.centerIn: parent
        opacity: 0.8
        rotation: 3
        scale: 0.5
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
          text: "Play"
          size: 25
          MouseArea {
             anchors.fill: parent
             onClicked: Controller.load_Option()
          }
       }
       Button {
          Layout.alignment: Qt.AlignCenter
          Layout.topMargin: 20
          text: "About"
          size: 25
          MouseArea {
             anchors.fill: parent
             onClicked: Controller.load_About()
          }
       }
       Button {
          Layout.alignment: Qt.AlignCenter
          Layout.topMargin: 20
          text: "Help"
          size: 25
          MouseArea {
             anchors.fill: parent
             onClicked: Controller.load_Help()
          }
       }
    }
}

