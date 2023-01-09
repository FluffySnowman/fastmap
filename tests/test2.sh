tmux new-session -d -s session1 'gping google.com'
tmux split-pane
tmux send-keys -t 1 "ping google.com" ENTER
tmux attach-session
