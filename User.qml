import QtQuick 2.0
import QtQuick.Layouts 1.15
Item {
    id: user
    implicitWidth: row.implicitWidth
    implicitHeight: row.implicitHeight
    property alias fontSize: txtInput.font.pixelSize
    property alias title: title.text
    Row{
        id: row
        spacing: 10
        anchors.verticalCenter: parent.verticalCenter

        Text{
            id: title
            anchors.verticalCenter: parent.verticalCenter
            font.family: "Siemens Sans Black"
            font.pixelSize: user.fontSize
            color: "#4f4b4b"
        }

        Rectangle {
            id: background
            anchors.verticalCenter: parent.verticalCenter
            width: 200
            color: "steelblue"
        }
        TextInput{
            id: txtInput
            anchors.centerIn: parent
            horizontalAlignment: txtInput.AlignHCenter
            width: parent - 30
            font.family: "Siemens Sans Black"
            color: "steelblue"
            Text {
               id: txtPlaceholder
               anchors {
                  centerIn: parent
               }
               text: "Fill in the name"
               font.pixelSize: txtInput.font.pixelSize
               font.family: "Bauhaus 93"
               color: "#6b6868"
               visible: !(txtInput.activeFocus || txtInput.text)
            }
        }

    }
}
