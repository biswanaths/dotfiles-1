#!/usr/bin/env bash
ECOUTE_TRACK=$(osascript <<EOF
if appIsRunning("Ecoute") then
    tell app "Ecoute" to get the name of the current track
end if

on appIsRunning(appName)
    tell app "System Events" to (name of processes) contains appName
end appIsRunning
EOF)

if test "x$ECOUTE_TRACK" != "x"; then
ECOUTE_ARTIST=$(osascript <<EOF
if appIsRunning("Ecoute") then
    tell app "Ecoute" to get the artist of the current track
end if

on appIsRunning(appName)
    tell app "System Events" to (name of processes) contains appName
end appIsRunning
EOF)

# Musical Symbols: ☊ ♫ ♪. Use anyone you like.

    echo ' | ☊' $ECOUTE_TRACK '-' $ECOUTE_ARTIST
fi
