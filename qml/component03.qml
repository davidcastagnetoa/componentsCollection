import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Shapes 1.15
import QtGraphicalEffects 1.15
import "controls"

Window {
    id: socialMediaTopBar
    width: 465
    height: 80
    color: "#00000000"
    visible: true
    title: qsTr("Social Media Top Bar")

     //REMOVE TITLE BAR
    flags: Qt.SplashScreen | Qt.FramelessWindowHint

    property bool isDarkMode: true

    QtObject{
        id: internal
        function toggleDayNight() {
            if(isDarkMode == true){
                isDarkMode = false
            }else{
                isDarkMode = true
            }
        }
    }

    Rectangle {
        id: bgBack
        color: isDarkMode ? "#111111" : "#bfbfbe"
        radius: 30
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 5
        anchors.rightMargin: 5
        anchors.bottomMargin: 20
        anchors.topMargin: 20
    }

    Rectangle {
        id: bg
        width: 420
        color: isDarkMode ? "#111111" : "#bfbfbe"
        radius: 35
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 5
        anchors.bottomMargin: 5
        anchors.topMargin: 5

        DragHandler {
            onActiveChanged: if(active){
                                 socialMediaTopBar.startSystemMove()
                             }
        }

        RoundedButton{
            id: messageBtn
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 4
            anchors.bottomMargin: 4
            anchors.topMargin: 4
            btnColorDefault: "#111315"
            btnColorMouseOver: "#15181a"
            btnColorClicked: "#000000"
            //            btnBorderColorDefault: "#000000"
            btnBorderColorMouseOver: "#23272E"
            //            btnBorderColorClicked: "#d1d1d1"
            btnTextColorDefault : "#FFFFFF"
            btnTextColorMouseOver : "#c1c1c1"
            btnTextColorClicked : "#5bc4ff"
            btnBorderColorDefault: isDarkMode ? "#060606" :"#000000"
            btnBorderColorClicked: isDarkMode ? "#7b171717" : "#d1d1d1"
        }

        CircleButton{
            id: bgIconContact
            anchors.left: messageBtn.right
            btnIconSource: "../images/icon_users.svg"
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            btnColorMouseOver: isDarkMode ? "#181b1e" : "#b8b8b8"
            btnColorDefault: isDarkMode ? "#111315" : "#aaaaaa"
            btnColorClicked: isDarkMode ? "#0a0a0a" : "#1e1e1e"
            btnBorderColorDefault: isDarkMode ? "#060606" :"#b97d7d7d"
            btnBorderColorClicked: isDarkMode ? "#7b171717" : "#919191"
            btnIconColorDefault: isDarkMode ? "#c7c7c7" : "#3e3e3e"
            btnIconColorClicked : isDarkMode ? "#00ff00" : "#d4d4d4"
            anchors.leftMargin: 8
            anchors.bottomMargin: 4
            width: 70
            iconWidth: 20
            iconHeight: 20
            anchors.topMargin: 4
        }

        CircleButton{
            id: bgIconCamera

            anchors.left: bgIconContact.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 8
            anchors.bottomMargin: 4
            anchors.topMargin: 4
            btnIconSource: "../images/aperture-len.svg"
            btnColorMouseOver: isDarkMode ? "#181b1e" : "#b8b8b8"
            btnColorDefault: isDarkMode ? "#111315" : "#aaaaaa"
            btnColorClicked: isDarkMode ? "#0a0a0a" : "#1e1e1e"
            btnBorderColorDefault: isDarkMode ? "#060606" :"#b97d7d7d"
            btnBorderColorClicked: isDarkMode ? "#7b171717" : "#919191"
            btnIconColorDefault: isDarkMode ? "#c7c7c7" : "#3e3e3e"
            btnIconColorClicked : isDarkMode ? "#ff0000" : "#d4d4d4"
            width: 70
            iconWidth: 20
            iconHeight: 20
        }


        ToggleButton{
            id: bgIconToggle
            anchors.left: bgIconCamera.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 8
            anchors.topMargin: 4
            anchors.bottomMargin: 4
            onClicked: internal.toggleDayNight()
        }
    }

    Button{
        id: turnOffBtn
        width: 28
        height: 28
        anchors.right: bgBack.right
        anchors.rightMargin: 5
        display: AbstractButton.TextBesideIcon
        activeFocusOnTab: true
        onClicked: socialMediaTopBar.close()

        property color btnColorDefault: "#259d00"
        property color btnColorMouseOver: "#2db400"
        property color btnColorClicked: "#ff0000"
        property color btnIconColor: "#ffffff"
        property var dynamicColor: if(turnOffBtn.down){
                                       turnOffBtn.down ? btnColorClicked : btnColorDefault
                                   } else {
                                       turnOffBtn.hovered ? btnColorMouseOver : btnColorDefault
                                   }
        x: 425
        y: 26


        background: Rectangle{
            id: bgBtn
            radius: 10
            border.color: turnOffBtn.down ? "#111114" : turnOffBtn.hovered ? "#101012" : "#101012"
            border.width: 1
            color: turnOffBtn.down ? "#171719" : turnOffBtn.hovered ? "#232326" : "#29292d"

            Image {
                id: turnOffImage
                width: 20
                height: 20
                anchors.verticalCenter: parent.verticalCenter
                source: "../images/shutdown.svg"
                anchors.horizontalCenter: parent.horizontalCenter
                antialiasing: true
                sourceSize.height: 24
                sourceSize.width: 25
                fillMode: Image.PreserveAspectFit

                ColorOverlay{
                    visible: true
                    source: turnOffImage
                    clip: true
                    antialiasing: false
                    color: turnOffBtn.down ? turnOffBtn.btnColorClicked : turnOffBtn.hovered ? turnOffBtn.btnColorMouseOver : turnOffBtn.btnColorDefault
                    anchors.fill: parent
                }
            }
        }
    }



}



/*##^##
Designer {
    D{i:0;formeditorZoom:2;height:80;width:460}D{i:2}D{i:8}
}
##^##*/
