import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Shapes 1.15
import QtGraphicalEffects 1.15


Window {
    id: finanzas
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
        anchors.horizontalCenter: parent.horizontalCenter

        DragHandler {
            onActiveChanged: if(active){
                                 finanzas.startSystemMove()
                             }
        }
        Rectangle{
            id: bgInner
            radius: 25
            border.color: "#111114"
            border.width: 1
            anchors.fill: parent
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#1f1f22"
                }

                GradientStop {
                    position: 1
                    color: "#1a1a1f"
                }
            }
            anchors.rightMargin: 4
            anchors.leftMargin: 4
            anchors.bottomMargin: 4
            anchors.topMargin: 4
        }

        Rectangle {
            id: bgCircle2
            x: 9
            y: 9
            width: 202
            height: 202
            visible: true
            color: "#000000"
            radius: 112
            border.color: "#a0a0a6"
            border.width: 0
            anchors.verticalCenter: parent.verticalCenter
            z: 0
            anchors.horizontalCenter: parent.horizontalCenter
        }


        Rectangle {
            id: bgCircle
            x: 9
            y: 9
            width: 188
            height: 188
            visible: true
            color: "#000000"
            radius: 92.5
            border.color: "#a0a0a6"
            anchors.verticalCenter: parent.verticalCenter
            z: 0
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            id: bgCircle3
            x: 9
            y: 9
            width: 140
            height: 140
            visible: true
            color: "#000000"
            radius: 92.5
            border.color: "#a0a0a6"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            z: 0
        }

        Item {
            id: innerBgCircle
            implicitWidth: 150
            implicitHeight: 150
            clip: true

            //PROPERTIES
            // General
            property bool roundCap: true
            property int startAngle: 0
            property real maxValue: 100
            property real value: 50
            property int samples: 12

            // Bg Circle OutCome
            property color bgColor: "transparent"
            property color bgStrokeColor: "#101214"
            property int strokeBgWidth: 16
            // Progress Circle
            property color progressColor: "#00C859"
            property int progressWidth: 16

            // Progress Circle Outcome
            property real outComeMaxValue: 4000.00
            property real outComeValue: 3500.00
            property int startAngleOutcome : 80
            property color progressColorOutcome: outcomeColor
            property int progressWidthOutcome: 16
            // Progress Circle Income
            property real inComeMaxValue: 3000.00
            property real inComeValue: 2500.00
            property int startAngleIncome : -80
            property color progressColorIncome: incomeColor
            property int progressWidthIncome: 16
            width: 180
            height: 180
            anchors.verticalCenter: bgCircle2.verticalCenter
            anchors.horizontalCenter: bgCircle2.horizontalCenter


            Shape{
                id: shape
                anchors.bottom: parent.bottom
                anchors.fill: parent
                layer.enabled: true
                layer.samples: innerBgCircle.samples
                layer.effect: innerBgCircle.enableDropShadow ? internal.dropShadow : null


                ShapePath{
                    id: pathBG
                    strokeColor: innerBgCircle.bgStrokeColor
                    fillColor: innerBgCircle.bgColor
                    strokeWidth: innerBgCircle.strokeBgWidth
                    capStyle: innerBgCircle.roundCap ? ShapePath.RoundCap : ShapePath.FlatCap

                    PathAngleArc{
                        x: 0
                        relativeY: 0
                        relativeX: 0
                        moveToStart: true
                        radiusX: (innerBgCircle.width / 2) - (innerBgCircle.progressWidth / 2)
                        radiusY: (innerBgCircle.height / 2) - (innerBgCircle.progressWidth / 2)
                        centerX: innerBgCircle.width / 2
                        centerY: innerBgCircle.height / 2
                        startAngle: innerBgCircle.startAngle
                        sweepAngle: 360

                    }
                }

                ShapePath{
                    id: pathOutcome
                    strokeColor: innerBgCircle.progressColorOutcome
                    fillColor: "transparent"
                    strokeWidth: innerBgCircle.progressWidthOutcome
                    capStyle: innerBgCircle.roundCap ? ShapePath.RoundCap : ShapePath.FlatCap

                    PathAngleArc{
                        radiusX: (innerBgCircle.width / 2) - (innerBgCircle.progressWidth / 2)
                        radiusY: (innerBgCircle.height / 2) - (innerBgCircle.progressWidth / 2)
                        centerX: innerBgCircle.width / 2
                        centerY: innerBgCircle.height / 2
                        startAngle: innerBgCircle.startAngleOutcome
                        sweepAngle: ((180/innerBgCircle.outComeMaxValue) * innerBgCircle.outComeValue)
                    }
                }

                ShapePath{
                    id: pathIncome
                    strokeColor: innerBgCircle.progressColorIncome
                    fillColor: "transparent"
                    strokeWidth: innerBgCircle.progressWidthIncome
                    capStyle: innerBgCircle.roundCap ? ShapePath.RoundCap : ShapePath.FlatCap

                    PathAngleArc{
                        sweepAngle: (140/ innerBgCircle.outComeMaxValue * innerBgCircle.outComeValue)
                        startAngle: innerBgCircle.startAngleIncome
                        radiusX: (innerBgCircle.width / 2) - (innerBgCircle.progressWidth / 2)
                        radiusY: (innerBgCircle.height / 2) - (innerBgCircle.progressWidth / 2)
                        centerX: innerBgCircle.width / 2
                        centerY: innerBgCircle.height / 2
                    }
                }
            }
        }



        Item {
            id: outcomeObj
            width: 80
            height: 20
            anchors.top: bgCircle.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: bgCircle.height * 1/4.5

            Text {
                id: outcomeText
                text: "Outcome"
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.rightMargin: 0
                font.wordSpacing: 0
                font.bold: true
                font.pointSize: 11
                font.letterSpacing: 0
                font.family: "Titillium Web SemiBold"
                color: outcomeColor
            }

            Image {
                id: imageUp
                width: 16
                height: 16
                visible: true
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Image.AlignHCenter
                verticalAlignment: Image.AlignVCenter
                source: "../../../../Pictures/SVG/ArrowUpCircle.svg"
                autoTransform: true
                layer.mipmap: false
                antialiasing: true
                sourceSize.height: 18
                sourceSize.width: 18
                fillMode: Image.PreserveAspectFit

                ColorOverlay{
                    visible: true
                    source: imageUp
                    clip: true
                    antialiasing: false
                    color: outcomeColor
                    anchors.fill: parent
                }
            }
        }

        Item {
            id: incomeObj
            width: 70
            height: 20
            anchors.bottom: bgCircle.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: bgCircle.height * 1/4.5


            Text {
                id: incomeText
                text: "Income"
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.rightMargin: 0
                font.wordSpacing: 0
                font.bold: false
                font.pointSize: 11
                font.letterSpacing: 0
                font.family: "Titillium Web SemiBold"
                color: incomeColor
            }

            Image {
                id: imageDown
                width: 16
                height: 16
                visible: true
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: incomeText.left
                horizontalAlignment: Image.AlignHCenter
                verticalAlignment: Image.AlignVCenter
                source: "../../../../Pictures/SVG/ArrowDownCircle.svg"
                autoTransform: true
                layer.mipmap: false
                antialiasing: true
                sourceSize.height: 18
                sourceSize.width: 18
                anchors.rightMargin: 5
                fillMode: Image.PreserveAspectFit

                ColorOverlay{
                    visible: true
                    source: imageDown
                    clip: true
                    antialiasing: false
                    color: incomeColor
                    anchors.fill: parent
                }
            }
        }

        Label {
            id: labelOutcome
            x: 76
            color: "#ffffff"
            text: "$" + outComeValueLbl
            anchors.top: outcomeObj.bottom
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 5
            font.bold: false
            font.pointSize: 12
            font.family: "Titillium Web Regular"
        }


        Label {
            id: labelIncome
            x: 76
            color: "#ffffff"
            text: "$" + inComeValueLbl
            anchors.bottom: incomeObj.top
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 5
            font.bold: false
            font.pointSize: 12
            font.family: "Titillium Web Regular"
        }


        Rectangle {
            id: separator
            width: 100
            height: 2
            color: "#8c8c91"
            radius: 1
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            DropShadow{
                id: dropShadowBG
                opacity: 1
                anchors.fill: separator
                source: separator
                spread: 0
                samples: 5
                anchors.rightMargin: -1
                anchors.leftMargin: -1
                anchors.bottomMargin: -1
                anchors.topMargin: -1
                verticalOffset: 0.5
                horizontalOffset: 0.8
                radius: 3.5
                color: "#5c00e2ee"
                z: 0
            }
        }

        Button{
            id: turnOffBtn
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 15
            anchors.rightMargin: 15
            width: 28
            height: 28
            display: AbstractButton.TextBesideIcon
            activeFocusOnTab: true
            onClicked: finanzas.close()

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


