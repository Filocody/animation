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
        state: "leftState"

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
            MouseArea {
                anchors.fill: parent
                onClicked: scene.state = "leftState"
            }
        }
        Rectangle {
            id: rightRect
            x: 300
            y: 200
            color: "lightgrey"
            width: 100
            height: 100
            border.color: "black"
            border.width: 3
            radius: 5
            //
            MouseArea {
                anchors.fill: parent
                onClicked: scene.state = "rightState"
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
                name: "rightState"
                PropertyChanges {
                    target: ball
                    x: rightRect.x + 5

                }
            } ,
            State {
                name: "leftState"
                PropertyChanges {
                    target: ball
                    x: leftRect.x + 5
                }
            }

        ]

        transitions: [
            Transition {
                from: "leftState"
                to: "rightState"

                NumberAnimation {
                    properties: "x, y"
                    duration: 500
                    easing.type: Easing.OutBounce
                }
            },
            Transition {
                from: "rightState"
                to: "leftState"

                NumberAnimation {
                    properties: "x, y"
                    duration: 1000
                    easing.type: Easing.InOutExpo
                }
            }
        ]
    }
}
