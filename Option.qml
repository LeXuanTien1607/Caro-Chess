import QtQuick 2.0
import QtQuick.Layouts 1.15
Item {    
    id: optionScreen
    width: 640
    height: 500

    Image {
        id: img4
        source: "qrc:/chuan-bi-noi-dung-bai-thuyet-trinh-bang-tieng-anh.jpg"
        anchors.fill: parent
        opacity: 0.8
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
          text: "Size (9x9)"
          size: 25
          color: "steelblue"
          MouseArea {
             anchors.fill: parent
             onClicked: {
                 Controller.save_Size(9);
                 Controller.load_Play();
             }
          }
       }

       Button {
          Layout.alignment: Qt.AlignCenter
          Layout.topMargin: 20
          text: "Size (12x12)"
          size: 25
          color: "steelblue"
          MouseArea {
             anchors.fill: parent
             onClicked: {
                 Controller.save_Size(12);
                 Controller.load_Play();
             }
          }
       }
       Button {
          Layout.alignment: Qt.AlignCenter
          Layout.topMargin: 20
          text: "Size (15x15)"
          size: 25
          color: "steelblue"
          MouseArea {
             anchors.fill: parent
             onClicked: {
                 Controller.save_Size(15);
                 Controller.load_Play();
             }
          }
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
