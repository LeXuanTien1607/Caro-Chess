import QtQuick 2.0

Rectangle {
    id: button
    property string text
    property bool pressed: false
    property alias size: buttonLabel.font.pixelSize

    signal clicked

    width: buttonLabel.width + 30; height: buttonLabel.height + 10
    border { width: 1; color: Qt.darker(button.color) }
    radius: 8
    color: "steelblue"
    smooth: true

    MouseArea {
        anchors.fill: parent
        onClicked: button.clicked()
    }
    Text {
        id: buttonLabel
        anchors.centerIn: button
        text: button.text
        font.family: "Siemens Sans Black"
        color: "white"
    }
}
