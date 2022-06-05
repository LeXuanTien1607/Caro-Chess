import QtQuick 2.0
import QtQuick.Layouts 1.15

Item {
   id: playScreen
   width: 480
   height: 640

   Rectangle {
      id: background
      color: "lightblue"
      anchors.fill: parent
   }
   Image {
      id: returnIcon
      x: 20; y: 20
      width: 20
      height: 20
      source: "qrc:/door_exit.png"

      MouseArea {
         id: returnArea
         anchors.fill: parent
         hoverEnabled: true
         onClicked: {
             Controller.return_Main()
         }
      }
   }
   Image {
      id: reloadIcon
      anchors {left: returnIcon.right; leftMargin: 10; verticalCenter: returnIcon.verticalCenter}
      height: returnIcon.height - 2
      width: returnIcon.width - 2
      source: "qrc:/275-2755889_repeat-reset-icon-hd-png-download.png"

      MouseArea {
         id: reloadArea
         anchors.fill: parent
         hoverEnabled: true
         onClicked: {
             Controller.reset_Game()
         }
      }
   }
   Row {
      anchors {horizontalCenter: parent.horizontalCenter; top: parent.top; topMargin: 50}
      spacing: 60
      Rectangle {
         id: playerX
         width: 100
         height: 100
         z: 2
         radius: 20
         color: "ghostwhite"
         border.color: "white"
         border.width: 2

         ColumnLayout {
            anchors {
               top: parent.top;
               horizontalCenter: parent.horizontalCenter
            }
            Text {
               id: txtPlayerX
               Layout.alignment: Qt.AlignCenter
               Layout.topMargin: 10
               text: qsTr("Player 1")
               font.family: "Comic Sans MS"
               font.pixelSize: 20
            }
            Image {
               Layout.alignment: Qt.AlignCenter
               Layout.topMargin: 5
               Layout.preferredHeight: 40
               Layout.preferredWidth: 40
               source: "qrc:/X.png"
            }
         }
         Rectangle {
            id: highlightX
            anchors.centerIn: playerX
            width: playerX.width + 20
            height: playerX.width + 20
            z: -1
            radius: 25
            color: "white"
            visible: false

            Behavior on visible {
               NumberAnimation {
                  target: highlightX
                  property: "scale"
                  from: 0.8
                  to: 1.0
                  duration: 200
               }
            }
         }
      }

      Rectangle {
         id: playerO
         width: 100
         height: 100
         z: 2
         radius: 20
         color: "ghostwhite"
         border.color: "white"
         border.width: 2
         ColumnLayout {
            anchors {
               top: parent.top;
               horizontalCenter: parent.horizontalCenter
            }
            Text {
               id: txtPlayerO
               Layout.alignment: Qt.AlignCenter
               Layout.topMargin: 10
               text: qsTr("Player 2")
               font.family: "Comic Sans MS"
               font.pixelSize: 20
            }
            Image {
               Layout.alignment: Qt.AlignCenter
               Layout.topMargin: 5
               Layout.preferredHeight: 40
               Layout.preferredWidth: 40
               source: "qrc:/O.png"
            }
         }
         Rectangle {
            id: highlightO
            width: playerO.width + 20
            height: playerO.width + 20
            anchors.centerIn: playerO
            z: -1
            radius: 25
            color: "orangered"
            visible: false

            Behavior on visible {
               NumberAnimation {
                  target: highlightO
                  property: "scale"
                  from: 0.8
                  to: 1.0
                  duration: 200
               }
            }

         }
      }
   }


   Rectangle {
      id: board
      width: gv.width + 60/_myModel.size
      height: gv.height + 60/_myModel.size
      color: "blue"
      radius: 60/_myModel.size

      anchors {horizontalCenter: parent.horizontalCenter; bottom: parent.bottom; bottomMargin: 30 }
      property bool player: false
      signal switchPlayer
      GridView {
         id: gv
         anchors.centerIn: board
         width: 420
         height: 420
         cellWidth: width/_myModel.size
         cellHeight: height/_myModel.size
         flickableDirection: Flickable.HorizontalAndVerticalFlick
         interactive: false
         model: _myModel
         delegate: Cell {
            id: cell
            width: gv.cellWidth
            height: gv.cellHeight
            border.width: 15/_myModel.size
            radius: 60/_myModel.size
            onClicked: {
               cell.source = (board.player == false) ? "qrc:/X.png" : "qrc:/O.png";
               cell.enable = false;
               Controller.markCell(model.index, board.player);
               board.player = !board.player

            }

         }
      }

      Connections {
         target: Controller
         function onWinGame() {
            gv.enabled = false;
            blur.visible = true;
            wintxt.visible = true;
            wintxt.text = (board.player == false) ? "Player 1 Win!" : "Player 2 Win!" ;
            restartButton.visible = true;
         }
      }
      Rectangle {
         id: blur
         anchors.fill: parent
         color: "white"
         visible: false
         Behavior on visible {
            NumberAnimation {
               target: blur
               property: "opacity"
               from: 0; to: 0.5
               duration: 200
            }
         }
      }
      Text {
         id: wintxt
         anchors.centerIn: parent
         font.family: "Showcard Gothic"
         color: "blue"
         style: Text.Raised
         visible: false
         Behavior on visible {
            SpringAnimation {
               target: wintxt
               property: "font.pixelSize"
               from: 0 ; to: 50
               spring: 2
               damping: 0.2
               duration: 2000
            }
         }
      }
      Button {
         id: restartButton
         anchors {horizontalCenter: wintxt.horizontalCenter; top: wintxt.bottom; topMargin: 50}
         text: "Restart Game?"
         size: 20
         visible: false
         MouseArea {
            anchors.fill: parent
            onClicked: {
                Controller.return_Main()
            }
         }
      }
   }
}
