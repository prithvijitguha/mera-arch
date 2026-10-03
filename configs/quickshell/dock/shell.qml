import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import QtQuick

PanelWindow {
    id: dock

    anchors.bottom: true
    anchors.left: true
    anchors.right: true

    implicitHeight: 70
    color: "transparent"

    // ------------------------------------------------------------
    // MangoWC clients
    // ------------------------------------------------------------

    property var clients: []

    Process {
        id: mangoWatch

        command: ["mmsg", "watch", "all-clients"]
        running: true

        stdout: SplitParser {
            onRead: line => {
                try {
                    let data = JSON.parse(line)

                    if (Array.isArray(data.clients))
                        dock.clients = data.clients
                } catch (e) {
                    // Ignore non-JSON output
                }
            }
        }
    }

    // ------------------------------------------------------------
    // Pinned applications
    // ------------------------------------------------------------

    property var pinned: [
        {
            name: "Ghostty",
            appid: "com.mitchellh.ghostty",
            exec: "ghostty",
            icon: "com.mitchellh.ghostty"
        },

        {
            name: "Firefox",
            appid: "firefox",
            exec: "firefox",
            icon: "firefox"
        },

        {
            name: "Steam",
            appid: "steam",
            exec: "steam",
            icon: "steam"
        },

        {
            name: "Stremio",
            appid: "com.stremio.Stremio",
            exec: "stremio",
            icon: "com.stremio.Stremio"
        },

        {
            name: "WhatsApp",
            appid: "chrome-web.whatsapp.com__-Default",
            exec: "google-chrome",
            icon: "whatsapp"
        },

        {
            name: "Signal",
            appid: "signal-desktop",
            exec: "signal-desktop",
            icon: "signal-desktop"
        }
    ]

    // ------------------------------------------------------------
    // Helpers
    // ------------------------------------------------------------

    function findClient(appid) {
        return clients.find(c => c.appid === appid)
    }

    function isRunning(appid) {
        return findClient(appid) !== undefined
    }

    function launchOrFocus(app) {
        let client = findClient(app.appid)

        if (client !== undefined) {
            // Focus existing MangoWC client
            Quickshell.execDetached([
                "mmsg",
                "dispatch",
                "focusid",
                "client," + client.id
            ])
        } else {
            // Launch application
            Quickshell.execDetached([
                "sh",
                "-c",
                app.exec
            ])
        }
    }

    // ------------------------------------------------------------
    // Dock background
    // ------------------------------------------------------------

    Rectangle {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom

        width: row.width + 24
        height: 58

        radius: 16
        color: "#202020ee"

        Row {
            id: row

            anchors.centerIn: parent
            spacing: 8

            Repeater {
                model: dock.pinned

                delegate: Item {
                    width: 42
                    height: 48

                    property bool isRunning:
                        dock.isRunning(modelData.appid)

                    // App icon
                    Image {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top

                        width: 34
                        height: 34

                        source: "image://icon/" + modelData.icon

                        fillMode: Image.PreserveAspectFit
                        smooth: true
                    }

                    // Running indicator
                    Rectangle {
                        visible: parent.parent.isRunning

                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottom: parent.bottom

                        width: 6
                        height: 6
                        radius: 3

                        color: "white"
                    }

                    MouseArea {
                        anchors.fill: parent

                        onClicked: {
                            dock.launchOrFocus(modelData)
                        }
                    }
                }
            }
        }
    }
}
