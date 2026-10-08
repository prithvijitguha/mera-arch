//@ pragma IconTheme Papirus

import QtQuick
import Quickshell
import Quickshell.Wayland
import "dock"

ShellRoot {
    Variants {
        model: Quickshell.screens

        DockWidget {
            required property var modelData
            screen: modelData
        }
    }
}
