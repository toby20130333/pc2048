import QtQuick 2.2
import QtQuick.Controls 1.1
import Qt.labs.settings 1.0

import "logic.js" as Logic
import "../"

ApplicationWindow {
    id: window;
    visible: true
    width: 380
    height: 480
    minimumHeight: height;
    minimumWidth: width;
    maximumHeight: height;
    maximumWidth: width;
    title: qsTr("2048 PC版本")
    color: "white";
    Settings {
        id: settigns;
        property alias columns: board.col;
        property alias rows: board.row;
        property alias bestScore: scoreBoard.bestScore;
        property alias boardSize: optionsWnd.boardSize
    }

    property alias board: board;
    property alias scoreBoard: scoreBoard;
    property alias gameOverWnd: gameOverWnd

    ScoreBoard {
        id: scoreBoard;

        onOptionsClicked: {
            if (optionsWnd.opacity === 0.0){
                scoreBoard.canPlay = false;
                optionsWnd.animShow.start();
            }else{
                scoreBoard.canPlay = true;
                optionsWnd.animHide.start();
            }
        }
        Component.onCompleted: {
            scoreBoard.canPlay = true
            optionsWnd.opacity = 0.0;
            gameTips.opacity = 0;
        }
    }

    Board {
        id: board
    }
    Timer {
        id: movingTimer
        interval: 100; running: false;
        onTriggered: {
            Logic.onAnimEnd();
//            Logic.restart();
        }
    }

    Rectangle{
        focus: true
        Keys.onPressed: {
            if(Logic.move(event.key)) {
                movingTimer.start();
            }
            if(Logic.check2048())
            {
                console.log("best......");
                gameTips.gameStatus = "You Win it!!!"
                gameTips.startAnimation();
            }

            event.accepted = true;
        }
    }

    GameOverWnd {
        id: gameOverWnd;
    }
    OptionsWnd {
        id: optionsWnd;
        onApply: {
            scoreBoard.canPlay = true;
            var value = boardSize + 4;
            board.col = Logic.columns = value
            board.row = Logic.rows = value
            Logic.restart();
        }
    }
    GameTips{
        id:gameTips
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 24
        opacity: 0.0
    }
    Component.onCompleted: {
        Logic.init(board.col,board.row,window);
    }

    Component.onDestruction: {
        scoreBoard.bestScore = Math.max(scoreBoard.bestScore, scoreBoard.score);
    }
}
