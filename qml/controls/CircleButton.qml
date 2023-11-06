import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15


Button {
    id: circleButton

    // CUSTOM PROPERTIES
    property url btnIconSource: "../../images/message.svg"

    property int fontSize: 12
    property string fontFamily: "Titillium Web"

    property color btnColorDefault: "#aaaaaa"
    property color btnColorMouseOver: "#b8b8b8"
    property color btnColorClicked: "#787878"

    property color btnBorderColorDefault: "#000000"
    property color btnBorderColorClicked: "#d5d5d5"

    property color btnIconColorDefault : "#3e3e3e"
    property color btnIconColorMouseOver : "#c1c1c1"
    property color btnIconColorClicked : "#2a2a2a"

    property int iconWidth: 18
    property int iconHeight: 18

    QtObject{
        id: internal
        // MOUSE OVER AND CLICK CHANGE COLOR
        property var dynamicColor: if(circleButton.down){
                                       circleButton.down ? btnColorClicked : btnColorDefault
                                   } else {
                                       circleButton.hovered ? btnColorMouseOver : btnColorDefault
                                   }
    }

    implicitWidth: 62
    implicitHeight: 62

    background: Rectangle{
        id: bgBtn
        color: internal.dynamicColor
        radius: 30
        border.color: circleButton.down ? btnBorderColorClicked : circleButton.hovered ? btnBorderColorDefault : btnBorderColorDefault
        border.width: 1
    }

    contentItem: Item{
        anchors.fill: parent
        id: content

        Image {
            id: iconBtn
            source: btnIconSource
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
                color: circleButton.down ? btnIconColorClicked : circleButton.hovered ? btnIconColorDefault : btnIconColorDefault
                anchors.verticalCenter: parent.verticalCenter
                antialiasing: true
                width: iconWidth
                height: iconHeight
            }
        }
    }
}



/*##^##
Designer {
    D{i:0;formeditorZoom:3}
}
##^##*/
