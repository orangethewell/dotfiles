autostart-dwm

# Notification Daemon
wired &

# Bars
eww daemon
eww open bar
sleep 1s
python /home/orangethewell/.config/eww/scripts/tag-daemon.py &
eww open preview
