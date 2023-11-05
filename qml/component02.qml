import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Shapes 1.15
import QtGraphicalEffects 1.15
import "controls"

Window {
    id: starlink
    width: 250
    height: 250
    visible: true
    color: "#00000000"
    title: qsTr("Outcome/Income")

    //REMOVE TITLE BAR
    flags: Qt.SplashScreen | Qt.FramelessWindowHint

    //PROPERTIES
    property color outcomeColor: "#5bc4ff"
    property color incomeColor: "#37ff6c"

    property real outComeValueLbl: 3170.24
    property real inComeValueLbl: 2812.35

    //    QtObject{
    //        id: internal

    //        property Component dropShadow: DropShadow{
    //            fast: true
    //            verticalOffset: 0
    //            horizontalOffset: 0
    //            samples: innerBgCircle.samples
    //            radius: innerBgCircle.dropShadowRadius
    //        }
    //    }

    Rectangle {
        id: background
        width: 230
        height: 230
        radius: 25
        border.width: 0
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#17171a"
            }

            GradientStop {
                position: 1
                color: "#141416"
            }
        }
        DragHandler {
            onActiveChanged: if(active){
                                 starlink.startSystemMove()
                             }
        }

        Item {
            id: topBar
            height: 80
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0



            Rectangle {
                id: topRectangle
                color: "#0d0d0d"
                radius: 25
                anchors.fill: parent
            }
            Rectangle {
                id: bottomRectangle
                color: "#0d0d0d"
                radius: 0
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: 40
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.bottomMargin: 0
            }

            Text {
                id: downValue
                color: "#7ee5ff"
                text: qsTr("161.35")
                anchors.top: parent.top
                font.pixelSize: 22
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                lineHeight: 0.75
                font.weight: Font.DemiBold
                anchors.topMargin: 16
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Titillium Web"
            }
            Text {
                id: upValue
                color: "#dd6eff"
                text: qsTr("31.19")
                anchors.bottom: parent.bottom
                font.pixelSize: 19
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                lineHeight: 0.75
                font.weight: Font.DemiBold
                font.bold: false
                anchors.bottomMargin: 16
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Titillium Web"
            }
            CircularProgressBar{
                id: leftCircleValue
                width: 50
                height: 50
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: downValue.left
                textFontFamily: "Titillium Web Normal"
                textSize: 9
                anchors.rightMargin: 15
                value: 78
                progressWidth: 4
                strokeBgWidth: 4
                progressColor: "#3eff78"
                bgStrokeColor: "#19191d"
            }
            CircularProgressBar{
                id: rightCircleValue
                width: 50
                height: 50
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: downValue.right
                anchors.leftMargin: 15
                textFontFamily: "Titillium Web Normal"
                textSize: 9
                anchors.rightMargin: 15
                value: 67
                progressWidth: 4
                strokeBgWidth: 4
                progressColor: "#7ee5ff"
                bgStrokeColor: "#19191d"
            }
        }

        Rectangle {
            id: separator
            height: 1
            color: "#464646"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: topBar.bottom
            anchors.topMargin: 0
            anchors.leftMargin: 0
            anchors.rightMargin: 0
        }

        Text {
            id: startlinkText
            color: "#ffffff"
            text: qsTr("StarLink")
            anchors.left: parent.left
            anchors.top: separator.bottom
            font.pixelSize: 23
            font.bold: true
            anchors.leftMargin: 16
            anchors.topMargin: 10
            font.family: "Titillium Web Light"
        }

        Item {
            id: itemValueMs
            width: 85
            height: 31
            anchors.left: parent.left
            anchors.top: startlinkText.bottom
            anchors.leftMargin: 16
            anchors.topMargin: 5

            Text {
                id: valueText
                x: 42
                y: 29
                color: "#3cf573"
                text: qsTr("24 ms")
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                font.pixelSize: 26
                font.weight: Font.Bold
                anchors.rightMargin: 0
                font.bold: true
                font.family: "Titillium Web Light"
            }

            Rectangle {
                id: rectangle
                y: 40
                width: 10
                height: 10
                color: "#3eff78"
                radius: 5
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 0
            }

        }

        Item {
            id: itemPublic
            width: 160
            height: 20
            anchors.left: parent.left
            anchors.top: itemValueMs.bottom
            anchors.leftMargin: 16
            anchors.topMargin: 7

            Text {
                id: publicText
                y: 29
                color: "#9b9b9c"
                text: qsTr("Public: ")
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                font.pixelSize: 16
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 0
                font.bold: false
                font.family: "Titillium Web Light"
            }
            Text {
                id: publicIpValue
                y: 29
                color: "#ffffff"
                text: qsTr("194.25.254.50")
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: publicText.right
                font.pixelSize: 16
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 0
                font.bold: false
                font.family: "Titillium Web Light"
            }

        }

        Item {
            id: itemLocal
            width: 160
            height: 20
            anchors.left: parent.left
            anchors.top: itemPublic.bottom
            anchors.leftMargin: 16
            anchors.topMargin: 3

            Text {
                id: localText
                y: 29
                color: "#9b9b9c"
                text: qsTr("Local: ")
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                font.pixelSize: 16
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 0
                font.bold: false
                font.family: "Titillium Web Light"
            }
            Text {
                id: localIpValue
                y: 29
                color: "#ffffff"
                text: qsTr("192.168.1.3")
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: localText.right
                font.pixelSize: 16
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 0
                font.bold: false
                font.family: "Titillium Web Light"
            }

        }

        Button{
            id: turnOffBtn
            anchors.right: parent.right
            anchors.top: separator.bottom
            anchors.topMargin: 15
            anchors.rightMargin: 15
            width: 28
            height: 28
            display: AbstractButton.TextBesideIcon
            activeFocusOnTab: true
            onClicked: starlink.close()

            property color btnColorDefault: "#259d00"
            property color btnColorMouseOver: "#2db400"
            property color btnColorClicked: "#ff0000"
            property color btnIconColor: "#ffffff"
            property var dynamicColor: if(turnOffBtn.down){
                                           turnOffBtn.down ? btnColorClicked : btnColorDefault
                                       } else {
                                           turnOffBtn.hovered ? btnColorMouseOver : btnColorDefault
                                       }


            background: Rectangle{
                id: bgBtn
                radius: 10
                border.color: turnOffBtn.down ? "#111114" : turnOffBtn.hovered ? "#101012" : "#101012"
                border.width: 1
                color: turnOffBtn.down ? "#171719" : turnOffBtn.hovered ? "#232326" : "#29292d"

//                DropShadow{
//                    id: dropShadowBG
//                    opacity: 0.349
//                    anchors.fill: bgBtn
//                    source: bgBtn
//                    samples: 10
//                    anchors.rightMargin: -1
//                    anchors.leftMargin: -1
//                    anchors.bottomMargin: -1
//                    anchors.topMargin: -1
//                    verticalOffset: 5
//                    horizontalOffset: 0
//                    radius: 10
//                    color: "#5cff1919"
//                    z: 0
//                }

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
}

