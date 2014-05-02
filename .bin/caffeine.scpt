#!/usr/bin/osascript
tell application "Caffeine"
    if active then
        turn off
        set status to "deactivated"
    else
        turn on
        set status to "activated"
    end if

    set output to "Caffeine has been " & status

    return output

end tell
