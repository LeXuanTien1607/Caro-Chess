import QtQuick 2.15
import QtQuick.Window 2.15
import QtMultimedia 5.6
Window {
    id: root
    height: screenLoader.implicitHeight
    width: screenLoader.implicitWidth
    visible: true
    title: qsTr("Caro")
    Loader{
        id: screenLoader
        objectName: "screenLoader"
        source: "StartScreen.qml"
    }

    Connections{
        target: Controller
        function onM_loadAbout(source1){
            screenLoader.source = source1;
        }
    }
    Connections{
        target: Controller
        function onM_loadHelp(source2){
            screenLoader.source = source2;
        }
    }
    Connections{
        target: Controller
        function onM_returnMain(source3){
            screenLoader.source = source3;
        }
    }

    Connections{
        target: Controller
        function onM_loadPlay(source4){
            screenLoader.source = source4;
        }
    }    

    Connections{
        target: Controller
        function onM_resetGame(source5){
            screenLoader.source = source5;
        }
    }

    Connections{
        target: Controller
        function onM_loadOption(source6){
            screenLoader.source = source6;
        }
    }
}
