import QtQuick 2.0
import QtQuick.Layouts 1.15
Item {
    id: it2
    width: 640
    height: 500
    visible: true
    Image {
        id: img3
        source: "qrc:/images.png"
        anchors.fill: parent
        smooth: true
        }
    ColumnLayout{
        anchors {
           top: parent.top;
           horizontalCenter: parent.horizontalCenter
           topMargin: 100
        }
    Button {
        Layout.alignment: Qt.AlignCenter
        Layout.topMargin: 20
        text: "Help"
        size: 25
        color: "steelblue"
        }
        Button {
           Layout.alignment: Qt.AlignCenter
           Layout.topMargin: 20
           text: "Trò chơi cờ Caro (Tùy chọn Size). Bạn sử dụng \nchuột để chọn các ô, người chơi nào đánh dấu\n được 5 ô liên tiếp không bị chặn 2 đầu sẽ dành \nchiến thắng"
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
