import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Window 2.0
import QtQuick.Controls.Styles 1.1

Rectangle {
    id:main
    width: 100
    height: 62
    property alias  rateValue:sld.value
    Text {
        id:perenOf
        text: "4x4"
        horizontalAlignment: Text.AlignHCenter
        font.family: "微软雅黑";
        font.pointSize: 14;
        x:battey.x-50
        y:battey.y+battey.height/2
    }

    Rectangle{
        id:battey
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -20
        width: 22
        height: main.height/2
        //        color: "#00ffffff"
        border.width: 2
        border.color: "gray"
        rotation: 180
        radius: 5
        property color oneColor: "lightsteelblue"
        property color twoColor: "#f59563"
        property color thirdColor: "#8c7963"
        gradient: Gradient {
            GradientStop { position: 1.0; color: battey.oneColor }
            GradientStop { position: 0.5; color: battey.twoColor}
            GradientStop { position: 0.0; color: battey.thirdColor}
        }
        Column{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 2
            Repeater{
                id:rp
                model: 0
                property color rpColor: "green"
                property int rpHeight: 10
                Item{
                    id:line
                    width: 20
                    height: rp.rpHeight
                    property color myColor: rp.rpColor
                    Rectangle{
                        id:line1
                        width: 18
                        height: 2
                        anchors.centerIn: parent
                        color: line.myColor
                    }
                }
            }
        }
    }
    function setValue(value)
    {
        console.log("value  "+value)
        if(value<=4)
        {
            rp.rpColor = "#f59563";
            rp.rpHeight= 7;
        }else if(value >4 && value <=5)
        {
            rp.rpColor = "#49A9E3";
            rp.rpHeight= 5;
        }else if(value >5 && value <=6){
            rp.rpColor = "red";
            rp.rpHeight= 3;
        }else if(value >6 && value <=7){
            rp.rpColor = "#B9466D";
            rp.rpHeight= 4;
        }else{
            rp.rpColor = "red";
            rp.rpHeight= 3;
        }
        rp.model = ((battey.height-6)/rp.rpHeight)*(value/6);
        console.log("eeeeeeeeee "+rp.model)
    }
    property double iiii: 0.05
    function setValues()
    {
        console.log("iiiiiiiiiiiiiii "+iiii)
        if(iiii > 0.9){
            setValue(1.0);
            sld.value = 1.0;
            ti.stop();
            return;
        }
        iiii +=0.1;
        setValue(iiii);
        sld.value = iiii;
    }

    Slider{
        id:sld
        anchors.top: battey.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        width: 200
        height: 10
        minimumValue: 0
        maximumValue: 2
        tickmarksEnabled: false
        stepSize: 1
        opacity: main.opacity
        style: SliderStyle {
            groove: Rectangle {
                implicitWidth: 200
                implicitHeight: 10
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
        onValueChanged: {
            var tmpValue = 4+sld.value;
            console.log(" tmpValue  "+tmpValue);
            setValue(tmpValue);
            perenOf.text =tmpValue+"x"+tmpValue
        }
    }
}
