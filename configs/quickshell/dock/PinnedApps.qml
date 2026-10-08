pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root

    property var apps: [
        {
            id: "com.mitchellh.ghostty",
            label: "Ghostty",
            icon: "com.mitchellh.ghostty",
            execName: "ghostty",
            steamId: ""
        },
        {
            id: "firefox",
            label: "Firefox",
            icon: "firefox",
            execName: "firefox",
            steamId: ""
        },
        {
            id: "steam",
            label: "Steam",
            icon: "steam",
            execName: "steam",
            steamId: ""
        },
        {
            id: "com.stremio.Stremio",
            label: "Stremio",
            icon: "com.stremio.Stremio",
            execName: "stremio",
            steamId: ""
        },
        {
            id: "chrome-web.whatsapp.com__-Default",
            label: "WhatsApp",
            icon: "chrome-web.whatsapp.com__-Default",
            execName: "",
            steamId: ""
        },
        {
            id: "signal-desktop",
            label: "Signal",
            icon: "signal-desktop",
            execName: "signal-desktop",
            steamId: ""
        }
    ]

    function pinApp(id, label, icon, execName, steamId) {
        for (var i = 0; i < apps.length; i++) {
            if (apps[i].id === id)
                return
        }

        apps = apps.concat([{
            id: id,
            label: label,
            icon: icon,
            execName: execName || "",
            steamId: steamId || ""
        }])
    }

    function unpinApp(id) {
        apps = apps.filter(function(a) {
            return a.id !== id
        })
    }

    function isPinned(id) {
        for (var i = 0; i < apps.length; i++) {
            if (apps[i].id === id)
                return true
        }

        return false
    }
}
