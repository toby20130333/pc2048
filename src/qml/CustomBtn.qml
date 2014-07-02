import QtQuick 2.0

Rectangle {
    id: button
    width: 110
    height: 29
    radius: 3
    property color btnColor: "#f59563"
    signal clicked;
    property string label: "";
    color: btnColor
    Text {
        x: 18
        y: 6
        color: "#fbeee0"
        text: label
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        font.bold: true
        font.family: "微软雅黑"
        font.pixelSize: 14
    }

    MouseArea {
        anchors.fill: parent;
        onClicked: button.clicked();
    }
}
