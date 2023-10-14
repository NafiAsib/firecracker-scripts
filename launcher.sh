#!/bin/bash

tmux new-session -d -s firecracker

tmux split-window -t firecracker -h

tmux send-keys -t firecracker:0 './run-all.sh' C-m

tmux send-keys -t my_session:1 './vm-launcher.sh' C-m

# Wait for vm-launcher.sh to finish 
sleep 3 

# Close the second pane after vm-launcher.sh finishes
tmux kill-pane -t firecracker:1

