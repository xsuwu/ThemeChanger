echo "wallpaper gray"


kill_wallpaper_daemons() {
  pkill -x mpvpaper 2>/dev/null
  pkill -x swaybg 2>/dev/null
  pkill -x hyprpaper 2>/dev/null
  swww kill 2>/dev/null
}

# Variables
WALLPAPER="$HOME/.config/ThemePicker/gray-theme/rofi-theme/Evangelion.png"
SDDM_THEME_DIR="/usr/share/sddm/themes/sequoia_2"
TERMINAL="kitty"  
SCRIPTSDIR="$HOME/.config/hypr/scripts"  
IDIR="$HOME/.config/hypr/icons" 
SWWW_PARAMS="--transition-type wipe --transition-fps 144 --transition-duration 2"



# creo que esto es el wallpaper
apply_image_wallpaper() {
  # Check if swww is installed
  if ! command -v swww >/dev/null 2>&1; then
    notify-send -i "${IDIR}/error.png" "Error" "swww not installed. Please install it."
    exit 1
  fi

  # cerrar hyprpaper
    kill_wallpaper_daemons

  # swww
  if ! pgrep -x "swww-daemon" >/dev/null; then
    echo "Starting swww-daemon..."
    swww-daemon --format xrgb &
    sleep 1  
  fi

  # que monitor
  FOCUSED_MONITOR=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .name')
  if [ -z "$FOCUSED_MONITOR" ]; then
    echo "No focused monitor detected. Using default output."
    FOCUSED_MONITOR=""
  fi

  # wallpaper ahora si
  swww img -o "$FOCUSED_MONITOR" "$WALLPAPER" $SWWW_PARAMS
  if [ $? -ne 0 ]; then
    notify-send -i "${IDIR}/error.png" "Error" "Failed to set wallpaper."
    exit 1
  fi

}

  # Set SDDM wallpaper
set_sddm_wallpaper() {
  if [ ! -d "$SDDM_THEME_DIR" ]; then
    echo "SDDM theme directory $SDDM_THEME_DIR not found."
    return
  fi

  # Check if yad is installed
  if ! command -v yad >/dev/null 2>&1; then
    notify-send -i "${IDIR}/error.png" "Error" "yad not installed. Skipping SDDM wallpaper."
    return
  fi

  # Prompt user to set SDDM wallpaper
  if yad --info --text="Set current wallpaper as SDDM background?\n\nNOTE: This only applies to SEQUOIA SDDM Theme" \
    --text-align=left \
    --title="SDDM Background" \
    --timeout=5 \
    --timeout-indicator=right \
    --button="Yes:0" \
    --button="No:1"; then

    # Check if terminal exists
    if ! command -v "$TERMINAL" >/dev/null 2>&1; then
      notify-send -i "${IDIR}/error.png" "Error" "$TERMINAL not installed."
      return
    fi

    # Copy wallpaper to SDDM theme
    $TERMINAL -e bash -c "echo 'Enter your password to set wallpaper as SDDM Background'; \
      sudo cp -f '$WALLPAPER' '$SDDM_THEME_DIR/backgrounds/default' && \
      notify-send -i '${IDIR}/ja.png' 'SDDM' 'Background SET' || \
      notify-send -i '${IDIR}/error.png' 'Error' 'Failed to set SDDM background.'"
  fi
}

#cosas
apply_image_wallpaper
set_sddm_wallpaper