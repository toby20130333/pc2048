import QtQuick 2.0
import QtGraphicalEffects 1.0
import "logic.js" as Logic

Rectangle {
    id: scoreBoard
    width: 380
    height: 120
    color: "#fbfaef"
    property int score: 0;
    property int bestScore: 0
    property bool canPlay: true
    signal optionsClicked;

    Rectangle{
        id: name
        x: 20
        y: 20
        width: 100
        color: "#eecc61"
        height: 60
        radius: 10
        Text {
            color: "#f59563"
            text: qsTr("2048")
            font.family: "微软雅黑"
            font.bold: true
            font.pixelSize: 36
            anchors.centerIn: parent
        }
        LinearGradient {
                        id:selected
                        anchors.fill: parent
                        start: Qt.point(0, 0)
                        end: Qt.point(100, 60)
                        gradient: Gradient {
                            GradientStop { position: 0.0; color: "gray" }
                            GradientStop { position: 0.5; color: "white" }
                            GradientStop { position: 1.0; color: "gray" }
                        }
                        visible: true
                        SequentialAnimation {
                            running: true; loops: Animation.Infinite
                            NumberAnimation { target:selected; property: "opacity"; to: 1.0; duration: 500}
                            NumberAnimation { target:selected; property: "opacity"; to: 0.7; duration: 2000}
                        }
                    }
    }

    Rectangle {
        x: 150
        y: 0
        width: 110
        height: 48
        color: "#8c7963"
        radius: 3
        anchors.verticalCenter: name.verticalCenter
        anchors.verticalCenterOffset: -20
        Text {
            id: text1
            x: 0
            y: 0
            color: "#f2e7d9"
            text: qsTr("分数")
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 5
            font.pixelSize: 14
        }

        Text {
            id: text
            x: 38
            color: "#ffffff"
            text: score
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 21
            font.family: "微软雅黑"
            font.bold: true
            font.pixelSize: 20
        }
    }

    Rectangle {
        x: 265
        y: 0
        width: 110
        height: 48
        color: "#8c7963"
        radius: 3
        anchors.verticalCenter: name.verticalCenter
        anchors.verticalCenterOffset: -20
        Text {
            id: text3
            x: 0
            y: 0
            color: "#f2e7d9"
            text: qsTr("得分")
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 5
            font.pixelSize: 14
        }

        Text {
            id: bestScoreText
            x: 38
            color: "#ffffff"
            text: bestScore
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 21
            font.family: "微软雅黑"
            font.bold: true
            font.pixelSize: 20
        }
    }

    CustomBtn {
        id: btnNewGame
        x: 265
        y: 63
        label: qsTr("新建游戏")
        enabled: canPlay
        onClicked: {
            bestScore = Math.max(bestScore, score);
            Logic.restart();
            gameTips.gameStatus = "开始游戏!!!"
            gameTips.startAnimation();
        }
    }

    CustomBtn {
        id: btnOptions
        x: 150
        y: 63
        label: qsTr("设置");
        onClicked: scoreBoard.optionsClicked();
    }
    Text{
        id:tips
        text: "将相同数字融合相加，得到 2048 获胜!"
        x:20
        anchors.top: btnNewGame.bottom
        anchors.topMargin: 2
        font.family: "微软雅黑"
        font.bold: true
        font.pixelSize: 12
    }
}
