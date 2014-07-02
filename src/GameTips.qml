import QtQuick 2.0
import QtQuick.Controls 1.1

Item {
    id:gametips
    width: 200
    height: 62
    property string gameStatus: "开始游戏!!!"
    Text {
        id: labelTips
        anchors.centerIn: parent
        opacity: gametips.opacity
        color: "#D74F37"
        text: gameStatus
        font.bold: true
        font.pointSize: 23
        font.family: "微软雅黑"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter

    }
//    ShaderEffect{
//        width: 100; height: 100
//        property variant texture: labelTips
//        fragmentShader:"
//        varying highp vec2 sampleCoord;
//        uniform sampler2D texture;
//        uniform lowp vec4 color;
//        uniform highp float distMin;
//        uniform highp float distMax;
//        void main() {
//           gl_FragColor = color * smoothstep(distMin, distMax, texture2D(texture, sampleCoord).a);
//        }"
//    }

    SequentialAnimation {
            running: false
            id: animShow
            NumberAnimation { target: gametips; property: "opacity"; to: 1.0; duration: 500 }
            NumberAnimation { target: gametips; property: "opacity"; to: 0.5; duration: 2000 }
            NumberAnimation { target: gametips; property: "opacity"; to: 0.0; duration: 500 }
        }
    function startAnimation()
    {
        animShow.stop();
        animShow.start();
    }

//    NumberAnimation {
//        id: animShow
//        target: gametips
//        properties: "opacity"
//        from: 0.0
//        to: 1.0
//        duration: 300
//    }

//    NumberAnimation {
//        id: animHide
//        target: gametips
//        properties: "opacity"
//        from: 1.0
//        to: 0.0
//        duration: 300
//    }
}
