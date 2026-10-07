#!/bin/bash

CONFIG="${MANGO_CONFIG:-$HOME/.config/mango/config.conf}"

# Extract key/mouse/axis/gesture bindings while preserving the
# section comments from the Mango config.
awk '
function trim(s) {
    gsub(/^[ \t]+|[ \t]+$/, "", s)
    return s
}

# Keep track of the current section.
#
# A comment such as:
#   # Volume control
# becomes the heading for following bindings.
#
# Ignore generic comments like "# Key Bindings".
/^[[:space:]]*#[^#]/ {
    comment=$0
    sub(/^[[:space:]]*#[[:space:]]*/, "", comment)

    if (comment != "" &&
        comment !~ /More option/ &&
        comment !~ /key name refer/ &&
        comment !~ /mod keys name/ &&
        comment !~ /need relogin/ &&
        comment !~ /tags:/ &&
        comment !~ /support type/ &&
        comment !~ /tag_animation/ &&
        comment !~ /layout support/) {
        section=comment
    }
}

# Keyboard bindings
/^bind=/ {
    line=$0
    sub(/^bind=/, "", line)

    n=split(line, p, ",")
    mod=p[1]
    key=p[2]

    action=""
    for (i=3; i<=n; i++) {
        if (action != "")
            action=action ","
        action=action p[i]
    }

    printf "K\t%s\t%s\t%s\n", section, mod, key " → " action
}

# Mouse bindings
/^mousebind=/ {
    line=$0
    sub(/^mousebind=/, "", line)

    n=split(line, p, ",")
    mod=p[1]
    key=p[2]

    action=""
    for (i=3; i<=n; i++) {
        if (action != "")
            action=action ","
        action=action p[i]
    }

    printf "M\t%s\t%s\t%s\n", section, mod, key " → " action
}

# Axis bindings
/^axisbind=/ {
    line=$0
    sub(/^axisbind=/, "", line)

    n=split(line, p, ",")
    mod=p[1]
    key=p[2]

    action=""
    for (i=3; i<=n; i++) {
        if (action != "")
            action=action ","
        action=action p[i]
    }

    printf "A\t%s\t%s\t%s\n", section, mod, key " → " action
}

# Gesture bindings
/^gesturebind=/ {
    line=$0
    sub(/^gesturebind=/, "", line)

    n=split(line, p, ",")
    mod=p[1]
    direction=p[2]
    fingers=p[3]

    action=""
    for (i=4; i<=n; i++) {
        if (action != "")
            action=action ","
        action=action p[i]
    }

    printf "G\t%s\t%s\t%s\n", section, mod, fingers " finger " direction " → " action
}
' "$CONFIG"
