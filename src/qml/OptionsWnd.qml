import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Rectangle {
    id: optionsWnd

    property alias animShow: animShow
    property alias animHide: animHide
    property alias boardSize: sliderBoardSize.value

    signal apply;

    width: 380
    height: 380
    radius: 3
    color: "#ffffff"

    anchors {
        right: parent.right; rightMargin: 5
        left: parent.left; leftMargin: 5
        bottom: parent.bottom; bottomMargin: 5
        top: parent.top; topMargin: 100
    }
    NumberAnimation {
        id: animShow
        target: optionsWnd
        properties: "opacity"
        from: 0.0
        to: 1.0
        duration: 300
    }

    NumberAnimation {
        id: animHide
        target: optionsWnd
        properties: "opacity"
        from: 1.0
        to: 0.0
        duration: 300
    }

    Rectangle {
        x: 0
        y: 323
        width: 250
        height: 49
        color: "transparent"
        anchors.horizontalCenter: parent.horizontalCenter

        CustomBtn {
            id: btnApply
            x: 8
            y: 10
            label: "应用"
            //btnColor: "#000000"
            onClicked: {
                optionsWnd.animHide.start();
                optionsWnd.apply();
            }
        }

        CustomBtn {
            id: btnCancel
            x: 132
            y: 10
            label: "取消"
            //btnColor:"#000000"
            onClicked: {
                scoreBoard.canPlay = true;
                optionsWnd.animHide.start();
            }
        }
    }

    Rectangle {
        id: rectangle1
        anchors.centerIn: parent
        width: parent.width
        height: 37
        color: "transparent"
        Text {
            id: name
            text: qsTr("网格数乘 ");
            anchors.verticalCenter: parent.verticalCenter
            font.family: "微软雅黑"
            font.pixelSize: 16
            anchors.left: parent.left
            anchors.leftMargin: 20
            color: "#000000"
        }
        Slider {
            id: sliderBoardSize
            anchors.centerIn: parent
            width: 157
            height: 22
            stepSize: 1
            minimumValue: 0
            maximumValue: 3
            tickmarksEnabled: false
            onValueChanged: {
                var sum = 4 + value;
                labelSlider.text = sum + "x" + sum;
            }
            style: SliderStyle {
                    groove: Rectangle {
                        implicitWidth: 200
                        implicitHeight: 8
                        color: "gray"
                        radius: 8
                    }
                    handle: Rectangle {
                        anchors.centerIn: parent
                        color: control.pressed ? "white" : "lightgray"
                        border.color: "gray"
                        border.width: 2
                        width: 20
                        height: 20
                        radius: 10
                    }
                }
        }

        Label {
            id: labelSlider
            anchors.left: sliderBoardSize.right
            anchors.leftMargin: 10
            color: "#000000"
            text: qsTr("4x4")
            font.bold: true
            font.pointSize: 23
            font.family: "微软雅黑"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
    }
}
