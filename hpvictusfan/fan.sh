#!/usr/bin/bash

# Locate the correct pwm1_enable file
PWM_FILE=$(find /sys/devices/platform/hp-wmi/hwmon/ -name pwm1_enable -print -quit)

# Check if pwm1_enable exists
if [ ! -f "$PWM_FILE" ]; then
    echo "Error: pwm1_enable file not found."
    exit 1
fi

# Get the current status of pwm1_enable
PWM1_ENABLE_STATUS=$(cat "$PWM_FILE")

# Ensure the status is a valid number
if [[ ! "$PWM1_ENABLE_STATUS" =~ ^[0-9]+$ ]]; then
    echo "Error: Invalid status value in pwm1_enable."
    exit 1
fi

# Check the current status and toggle it
if [[ $PWM1_ENABLE_STATUS -eq 2 ]]; then
    echo "Enabling fan boost..."
    echo "0" | sudo tee "$PWM_FILE" > /dev/null
    echo "Fan boost has been enabled."
else
    echo "Disabling fan boost..."
    echo "2" | sudo tee "$PWM_FILE" > /dev/null
    echo "Fan boost has been disabled."
fi
