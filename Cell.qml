import QtQuick 2.0
Rectangle {
   id: cell
   property int size: 40
   property alias source: img.source
   property alias enable: mouseArea.enabled
   property alias text: txt.text
   signal clicked
   color: "white"
   width: gv.cellWidth
   height: gv.cellHeight
   border.color: "steelblue"
   MouseArea {
      id: mouseArea
      anchors.fill: parent
      onClicked: {
         cell.clicked()
      }
   }
   Image {
      id: img
      anchors.fill: parent
      anchors.margins: 5
   }
   Text {
      id: txt
      anchors.centerIn: parent
      font.pixelSize: 20
   }
}
