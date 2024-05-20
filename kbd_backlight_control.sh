#!/bin/bash

# Function to get current brightness
get_current_brightness() {
    dbus-send --system --type=method_call --print-reply=literal \
        --dest="org.freedesktop.UPower" "/org/freedesktop/UPower/KbdBacklight" \
        "org.freedesktop.UPower.KbdBacklight.GetBrightness" | awk '{print $2}'
}

# Function to get maximum brightness
get_max_brightness() {
    dbus-send --system --type=method_call --print-reply=literal \
        --dest="org.freedesktop.UPower" "/org/freedesktop/UPower/KbdBacklight" \
        "org.freedesktop.UPower.KbdBacklight.GetMaxBrightness" | awk '{print $2}'
}

# Check for input parameter and handle the logic
case $1 in
    up|down)
        current_brightness=$(get_current_brightness)
        max_brightness=$(get_max_brightness)

        if [ "$1" == "up" ]; then
            new_brightness=$((current_brightness + 1))
        else
            new_brightness=$((current_brightness - 1))
        fi

        # Ensure the new brightness is within the valid range
        if [ "$new_brightness" -lt 0 ]; then
            new_brightness=0
        elif [ "$new_brightness" -gt "$max_brightness" ]; then
            new_brightness="$max_brightness"
        fi

        # Command to set the new brightness
        dbus-send --system --type=method_call \
          --dest="org.freedesktop.UPower" "/org/freedesktop/UPower/KbdBacklight" \
          "org.freedesktop.UPower.KbdBacklight.SetBrightness" int32:$new_brightness

        echo "Brightness adjusted to $new_brightness"
        ;;
    status)
        current_brightness=$(get_current_brightness)
        max_brightness=$(get_max_brightness)
        echo "Current Brightness: $current_brightness"
        echo "Maximum Brightness: $max_brightness"
        ;;
    *)
        echo "Usage: $0 up|down|status"
        exit 1
        ;;
esac
