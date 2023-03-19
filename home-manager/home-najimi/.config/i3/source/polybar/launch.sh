
dir="$HOME/.config/i3/polybar/cuts/config.ini"

launch_bar() {

	killall -q polybar

	while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

	polybar -q top -c "$dir" &

	polybar -q bottom -c "$dir" &
}

launch_bar
