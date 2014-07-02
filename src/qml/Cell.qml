import QtQuick 2.0

import "logic.js" as Logic

Item {
    id: cell

    property alias value: lable.text;
    property size size: Qt.size(20,20);
    property bool animMoveEnable: false;
    property bool animResizeEnable: false

    width: parent.width / Logic.columns;
    height: parent.height / Logic.rows;
//    color: "transparent"
    Rectangle {
        id: styleBtn
        width: size.width;
        height: size.height;
        color: Logic.colors[value];
        radius: 5
        anchors.centerIn: parent
        smooth: true
        antialiasing:true
        Text {
            id: lable
            color: value == "2" || value == "4" ? "#686f66" : "#f7f8f0"
            text: value
            style: Text.Normal
            font.family: "微软雅黑"
            font.bold: true
            anchors.centerIn: parent
            font.pixelSize: Logic.fontSize[value.length]
            horizontalAlignment: Text.AlignHCenter
        }
        Component.onCompleted: {
            //console.log("000000000000000 "+lable.font.pixelSize)
        }
        Behavior on width {
            enabled: animResizeEnable;
            NumberAnimation {
                duration: 100;
                easing.type: Easing.InOutQuad
            }
        }

        Behavior on height {
            enabled: animResizeEnable;
            NumberAnimation {
                duration: 100;
                easing.type: Easing.InOutQuad
            }
        }
    }
    Behavior on x {
        enabled: animMoveEnable;
        NumberAnimation {
            duration: 100;
            easing.type: Easing.InOutQuad
        }
    }

    Behavior on y {
        enabled: animMoveEnable;
        NumberAnimation {
            duration: 100;
            easing.type: Easing.InOutQuad
        }
    }
}
