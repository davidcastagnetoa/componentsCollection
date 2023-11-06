import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15


Button {
    id: roundedButton
    text: qsTr("Message")

    // CUSTOM PROPERTIES
    property url btnIconLeftSource: "../../images/message.svg"
    property url btnIconRightDownSource: "../../images/down_icon.svg"
    property url btnIconRightUpSource: "../../images/up_icon.svg"


    property int fontSize: 12
    property string fontFamily: "Titillium Web"

    property color btnColorDefault: "#111315"
    property color btnColorMouseOver: "#15181a"
    property color btnColorClicked: "#000000"

    property color btnBorderColorDefault: "#000000"
    property color btnBorderColorMouseOver: "#23272E"
    property color btnBorderColorClicked: "#d5d5d5"

    property color btnTextColorDefault : "#FFFFFF"
    property color btnTextColorMouseOver : "#c1c1c1"
    property color btnTextColorClicked : "#99f1ff"

    property int iconWidth: 18
    property int iconHeight: 18
    property bool isActiveMenu: false

    QtObject{
        id: internal

        // MOUSE OVER AND CLICK CHANGE COLOR
        property var dynamicColor: if(roundedButton.down){
                                       roundedButton.down ? btnColorClicked : btnColorDefault
                                   } else {
                                       roundedButton.hovered ? btnColorMouseOver : btnColorDefault
                                   }
    }

    implicitWidth: 186
    implicitHeight: 62

    background: Rectangle{
        id: bgBtn
        color: internal.dynamicColor
        radius: 30
        border.color: roundedButton.down ? btnBorderColorClicked : roundedButton.hovered ? btnBorderColorDefault : btnBorderColorDefault
        border.width: 1
    }

    contentItem: Item{
        anchors.fill: parent
        id: content

        Image {
            id: iconLeftBtn
            source: btnIconLeftSource
            mirror: true
            anchors.leftMargin: 26
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            sourceSize.width: iconWidth
            sourceSize.height: iconHeight
            width: iconWidth
            height: iconHeight
            fillMode: Image.PreserveAspectFit
            visible: true
            antialiasing: true

            ColorOverlay{
                anchors.fill: iconLeftBtn
                source: iconLeftBtn
                anchors.horizontalCenter: parent.horizontalCenter
                color: roundedButton.down ? btnTextColorClicked : roundedButton.hovered ? btnTextColorMouseOver : btnTextColorDefault
                anchors.verticalCenter: parent.verticalCenter
                antialiasing: true
                width: iconWidth
                height: iconHeight
            }
        }



        Text{
            color: roundedButton.down ? btnTextColorClicked : roundedButton.hovered ? btnTextColorMouseOver : btnTextColorDefault
            text: roundedButton.text
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: fontSize
            font.weight: Font.Light
            font.family: fontFamily
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Image {
            id: iconRightBtn
            source:  roundedButton.down ? btnIconRightDownSource : btnIconRightUpSource
            mirror: false
            anchors.rightMargin: 26
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            sourceSize.width: iconWidth
            sourceSize.height: iconHeight
            width: iconWidth
            height: iconHeight
            fillMode: Image.PreserveAspectFit
            visible: true
            antialiasing: true

            ColorOverlay{
                anchors.fill: iconRightBtn
                source: iconRightBtn
                anchors.horizontalCenter: parent.horizontalCenter
                color: roundedButton.down ? btnTextColorClicked : roundedButton.hovered ? btnTextColorMouseOver : btnTextColorDefault
                anchors.verticalCenter: parent.verticalCenter
                antialiasing: true
                width: iconWidth
                height: iconHeight
            }
        }
    }
}


