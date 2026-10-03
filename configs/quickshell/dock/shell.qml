import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import QtQuick

PanelWindow {
    id: dock

    anchors.bottom: true
    anchors.left: true
    anchors.right: true

    implicitHeight: 82
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

                    if (Array.isArray(data.clients)) {
                        dock.clients = data.clients
                    }
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
            icon: ""
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
        for (let i = 0; i < clients.length; ++i) {
            if (clients[i].appid === appid)
                return clients[i]
        }

        return null
    }

    function isRunning(appid) {
        return findClient(appid) !== null
    }

    function launchOrFocus(app) {
        let client = findClient(app.appid)

        if (client !== null) {
            Quickshell.execDetached([
                "mmsg",
                "dispatch",
                "focusid",
                "client," + client.id
            ])
        } else {
            Quickshell.execDetached([
                "sh",
                "-c",
                app.exec
            ])
        }
    }

    // ------------------------------------------------------------
    // Dock
    // ------------------------------------------------------------

    Rectangle {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom

        // Wider
        width: row.width + 40

        // Taller
        height: 72

        // More rounded
        radius: 28

        color: "#202020ee"

        Row {
            id: row

            anchors.centerIn: parent

            spacing: 12

            Repeater {
                model: dock.pinned

                delegate: Item {
                    width: 50
                    height: 60

                    property bool isRunning:
                        dock.isRunning(modelData.appid)

                    // ------------------------------------------------
                    // App icon
                    // ------------------------------------------------

                    Image {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top

                        width: 44
                        height: 44

                        source: modelData.name === "WhatsApp"
                            ? "file://" + Quickshell.env("HOME") +
                              "/.local/share/applications/icons/whatsapp.png"
                            : "image://icon/" + modelData.icon

                        sourceSize.width: 44
                        sourceSize.height: 44

                        fillMode: Image.PreserveAspectFit
                        smooth: true
                    }

                    // ------------------------------------------------
                    // Running indicator
                    // ------------------------------------------------

                    Rectangle {
                        visible: dock.isRunning(modelData.appid)

                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottom: parent.bottom

                        width: 7
                        height: 7

                        radius: 3.5

                        color: "white"
                    }

                    // ------------------------------------------------
                    // Click
                    // ------------------------------------------------

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
