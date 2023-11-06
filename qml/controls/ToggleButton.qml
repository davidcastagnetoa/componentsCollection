import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15


Button {
    id: toggleButton

    // CUSTOM PROPERTIES
    property url btnIconSourceOn: "../../images/sun.svg"
    property url btnIconSourceOff: "../../images/moon.svg"

    property int fontSize: 12
    property string fontFamily: "Titillium Web"

    property color btnColorDefault: "#131a2a"
    property color btnColorMouseOver: "#1d2941"
    property color btnColorClicked: "#090d15"

    property color btnBorderColorDefault: "#000000"
    property color btnBorderColorClicked: "#d5d5d5"

    property color btnIconColorDefault : "#FFFFFF"
    property color btnIconColorMouseOver : "#c1c1c1"
    property color btnIconColorClicked : "#99f1ff"

    property color btnIconColorDay: "#ffd500"
    property color btnIconColorNight: "#62a2b6"

    property int iconWidth: 18
    property int iconHeight: 18
    property bool isActive: false

    QtObject{
        id: internal
        function toggleDarkMode() {
            if(isActive == true){
                btnColorDefault = "#131a2a"
                isActive = false
            }else{
                isActive = true
                btnColorDefault = "#090d15"
            }
        }

        // MOUSE OVER AND CLICK CHANGE COLOR
        property var dynamicColor: if(toggleButton.down){
                                       toggleButton.down ? btnColorClicked : btnColorDefault
                                   } else {
                                       toggleButton.hovered ? btnColorMouseOver : btnColorDefault
                                   }
    }

    implicitWidth: 62
    implicitHeight: 62

    background: Rectangle{
        id: bgBtn
        color: internal.dynamicColor
        radius: 30
        border.color: isActive ? btnBorderColorClicked : btnBorderColorDefault
        border.width: 1
    }

    contentItem: Item{
        anchors.fill: parent
        id: content

        Image {
            id: iconBtn
            source: isActive ? btnIconSourceOn : btnIconSourceOff
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            sourceSize.width: iconWidth
            sourceSize.height: iconHeight
            width: iconWidth
            height: iconHeight
            fillMode: Image.PreserveAspectFit
            visible: true
            antialiasing: true

            ColorOverlay{
                anchors.fill: iconBtn
                source: iconBtn
                anchors.horizontalCenter: parent.horizontalCenter
                color: isActive ? btnIconColorDay : btnIconColorNight
                anchors.verticalCenter: parent.verticalCenter
                antialiasing: true
                width: iconWidth
                height: iconHeight
            }
        }
    }
    onClicked: internal.toggleDarkMode()
}



/*##^##
Designer {
    D{i:0;formeditorZoom:3}
}
##^##*/
