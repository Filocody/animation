import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Make transition")

    Rectangle{
        id: scene
        anchors.fill: parent
        state: "InitialState"

        Rectangle {
            id: leftRect
            x: 100
            y: 200
            color: "lightgrey"
            width: 100
            height: 100
            border.color: "black"
            border.width: 3
            radius: 5
            //
            Text {
                id: name
                anchors.centerIn: parent
                text: "move"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (ball.x >= rightRect.x - 25) scene.state = "InitialState"
                    else {
                        ball.x += 30
                        scene.state = "OtherState"
                    }
                }
            }
        }
        Rectangle {
            id: rightRect
            x: 400
            y: 200
            color: "lightgrey"
            width: 100
            height: 100
            border.color: "black"
            border.width: 3
            radius: 5
            //
            Text {
                id: name_1
                anchors.centerIn: parent
                text: "return"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: scene.state = "InitialState"
            }
        }
        Rectangle {
            id: ball
            color: "darkgreen"
            x: leftRect.x + 5
            y: leftRect.y + 5
            width: leftRect.width - 10
            height: leftRect.height - 10
            radius: width / 2
        }



        states: [
            State {
                name: "InitialState"
                PropertyChanges {
                    target: ball
                    x: leftRect.x + 5
                }
            } ,
            State {
                name: "OtherState"
                PropertyChanges {
                    target: ball
                    x: ball.x
                }
            }

        ]

        transitions: [
            Transition {
                from: "OtherState"
                to: "InitialState"

                NumberAnimation {
                    properties: "x,y"
                    duration: 1000
                    easing.type: Easing.OutBounce
                }
            }
        ]
    }
}
