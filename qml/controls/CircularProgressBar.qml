import QtQuick 2.15
import QtQuick.Shapes 1.15
import QtGraphicalEffects 1.15

Item {
    id: progress
    implicitWidth: 250
    implicitHeight: 250

    // Properties
    // General
    property bool roundCap: true
    property int startAngle: -90
    property real maxValue: 100
    property real value: 50
    property int samples: 12
    // property url logoSource: "../../images/Anera Logo III.png"
    // Drop Shadow
    property bool enableDropShadow: false
    property color dropShadowColor: "#20000000"
    property int dropShadowRadius: 10
    // Bg Circle
    property color bgColor: "transparent"
    property color bgStrokeColor: "#101214"
    property int strokeBgWidth: 16
    // Progress Circle
    property color progressColor: "#00C859"
    property int progressWidth: 16
    // Text
    property string text: "%"
    property bool textShowValue: true
    property string textFontFamily: "Titillium Web ExtraLight"
    property int textSize: 25
    property color textColor: "#979aa0"

    // Internal Properties/Functions
    QtObject{
        id: internal

        property Component dropShadow: DropShadow{
            color: progress.dropShadowColor
            fast: true
            verticalOffset: 0
            horizontalOffset: 0
            samples: progress.samples
            radius: progress.dropShadowRadius
        }
    }


    Shape{
        id: shape
        anchors.fill: parent
        layer.enabled: true
        layer.samples: progress.samples
        layer.effect: progress.enableDropShadow ? internal.dropShadow : null

        Text {
            id: textProgress
            color: textColor
            visible: textShowValue
            text: progress.textShowValue ? parseInt(progress.value) + progress.text : progress.text
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: textSize
            font.family: textFontFamily
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            id: loadingBar
            x: 98
            y: 100
            width: 75
            height: 25
            visible: false
            color: "#151d27"
            radius: 12
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 55
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                id: text1
                color: "#ffffff"
                text: qsTr("Loading ...")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 15
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Titillium Web Light"
            }
        }

        ShapePath{
            id: pathBG
            strokeColor: progress.bgStrokeColor
            fillColor: progress.bgColor
            strokeWidth: progress.strokeBgWidth
            capStyle: progress.roundCap ? ShapePath.RoundCap : ShapePath.FlatCap

            PathAngleArc{
                radiusX: (progress.width / 2) - (progress.progressWidth / 2)
                radiusY: (progress.height / 2) - (progress.progressWidth / 2)
                centerX: progress.width / 2
                centerY: progress.height / 2
                startAngle: progress.startAngle
                sweepAngle: 360
            }
        }

        ShapePath{
            id: path
            strokeColor: progress.progressColor
            fillColor: "transparent"
            strokeWidth: progress.progressWidth
            capStyle: progress.roundCap ? ShapePath.RoundCap : ShapePath.FlatCap

            PathAngleArc{
                radiusX: (progress.width / 2) - (progress.progressWidth / 2)
                radiusY: (progress.height / 2) - (progress.progressWidth / 2)
                centerX: progress.width / 2
                centerY: progress.height / 2
                startAngle: progress.startAngle
                sweepAngle: (360 / progress.maxValue * progress.value)
            }
        }

//        Image {
//            id: image
//            x: 75
//            width: 190
//            height: 50
//            visible: false
//            anchors.top: parent.top
//            source: logoSource
//            sourceSize.height: 50
//            sourceSize.width: 190
//            anchors.topMargin: 65
//            anchors.horizontalCenter: parent.horizontalCenter
//            fillMode: Image.PreserveAspectFit
//        }


    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:250;width:250}
}
##^##*/
