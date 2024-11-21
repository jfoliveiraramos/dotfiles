#!/bin/bash

# Launch Waybar temporarily
echo "Starting Waybar..."
waybar &      # Launch Waybar in the background
WAYBAR_PID=$! # Capture the process ID of Waybar

# Keep Waybar open for a specific duration (e.g., 5 seconds)
DISPLAY_DURATION=5
echo "Waybar will be visible for $DISPLAY_DURATION seconds."
sleep $DISPLAY_DURATION

# Kill Waybar process
echo "Stopping Waybar..."
kill $WAYBAR_PID

echo "Waybar has been closed."
