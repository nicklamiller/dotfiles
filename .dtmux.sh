#!/bin/bash

# Define session name
SESSION_NAME="default"

# Check if the session already exists
tmux has-session -t $SESSION_NAME 2>/dev/null

if [ $? != 0 ]; then
    # Start a new tmux session
    tmux new-session -d -s $SESSION_NAME

    # Split the window vertically
    tmux split-window -v

    # Resize the bottom pane
    tmux resize-pane -D 7

    # Optionally, you can send commands to each pane if needed
    #tmux send-keys -t ${SESSION_NAME}:0.0 'echo "Top Pane"' C-m
    #tmux send-keys -t ${SESSION_NAME}:0.1 'echo "Bottom Pane"' C-m
fi

# Attach to the session
tmux attach -t $SESSION_NAME
