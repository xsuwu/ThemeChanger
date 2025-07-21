#!/bin/bash
echo "Theme Picker w/nord, beige, evangelion"
hyprctl reload

source ~/.config/ThemePicker/colors
    export color1 color2 color3 color4 color5 color15 color16 color17 color18 color19 color20 color21



#variables
gray_wallpaper="$HOME/.config/ThemePicker/gray-theme/rofi-theme/Evangelion.png"
beige_wallpaper="$HOME/.config/ThemePicker/beige-theme/rofi-theme/Lady.png"
nordwallpaper="$HOME/.config/ThemePicker/nord-theme/rofi-theme/Nord.png"
wallust_config="$HOME/.config/wallust/wallust.toml"
wallpaper="$HOME/.config/rofi/.current_wallpaper"
scriptsluis="$HOME/.config/ThemePicker/scripts"
nordicdarker="Nordic-darker"
gruvboxdarker="Gruvbox-Dark-Medium"
chicago95="Chicago95"
hyprlock_config="$HOME/.config/hypr/hyprlock.conf"

#solo wallpaper y wallust, wallust es mala idea por los cambios de colores en wallust-hyprland.conf
#set_wallpaper() {
#    local wallpaper="$1"
#    if [ -f "$wallpaper" ]; then
#       
#        pkill swaybg
#        #wallpaper nuevo
#        swaybg -i "$wallpaper" -m fill &
#        #actualizar wallust y los colores
#        wallust run "$wallpaper"
#        echo "wallpaper set to $wallpaper and colors updated"
#    else
#        echo "Error: wallpaper file not found at $wallpaper"
#        exit 1
#    fi
#}

if [[ "$1" == "beige" ]]; then
#theme beige
hyprctl --batch "\
    keyword general:col.active_border $color19;\
    keyword general:col.inactive_border $color20;\
    keyword general:gaps_out 5"

    #hyprlock
    HYPRLOCK_SOURCE="$HOME/.config/ThemePicker/beige-theme/hyprlock.conf"
    if [ -f "$HYPRLOCK_SOURCE" ]; then
        cp "$HYPRLOCK_SOURCE" "$hyprlock_config" ||{
            echo "failed to copy $HYPRLOCK_SOURCE  to $hyprlock_config"
            exit 1 
        }
        echo "Succesfully copied $HYPRLOCK_SOURCE to $hyprlock_config"
    else
        echo "file $HYPRLOCK_SOURCE not found"
        exit 1
fi

# source y destino
SOURCE="$HOME/.config/ThemePicker/beige-theme/wallust-hyprland.conf"
DEST="$HOME/.config/hypr/wallust/"

# existe?
if [ -f "$SOURCE" ]; then

  # cp
    cp "$SOURCE" "$DEST/" || {
        echo "ailed to copy $SOURCE to $DEST"
        exit 1
    }
    echo "successfully copied $SOURCE to $DEST"
else
    echo " source file $SOURCE does not exist"
    exit 1
fi


#rofi theme
beige_theme="$HOME/.config/ThemePicker/beige-theme/rofi-theme/beige.rasi"
current_theme="$HOME/.config/rofi/config.rasi"

    if [ -f "$beige_theme" ]; then
        cp "$beige_theme" "$current_theme" || {
        echo "could not switch to beige theme"
        exit 1
        }
        echo switched to beige theme lol
    else
        echo could not switch to beige theme
        exit 1
    fi

#set_wallpaper "$beige_wallpaper" <---- uncomment si estas usando el script que usa wallust


$scriptsluis/wallpaperbeige.sh #comment si estas usando el script que usa wallust
#cambiar el gtk theme
    echo "Setting GTK theme to $gruvboxdarker"
    gsettings set org.gnome.desktop.interface gtk-theme "Gruvbox-Dark-Medium"
                    
# Export settings to $HOME/.config/gtk-3.0/settings.ini for XWayland compatibility
    echo "Exporting settings to $HOME/.config/gtk-3.0/settings.ini"
    nwg-look -x

# Verify the theme was applied
    CURRENT_THEME=$(gsettings get org.gnome.desktop.interface gtk-theme)
        if [ "$CURRENT_THEME" == "'$gruvboxdarker'" ]; then
            echo "Successfully changed GTK theme to $gruvboxdarker"
        else
            echo "Error: Failed to change GTK theme. Current theme is $gruvboxdarker"
        exit 1
        fi
fi





#theme gray
if [[ "$1" == "gray" ]]; then
hyprctl --batch "\
    keyword general:col.active_border $color17;\
    keyword general:col.inactive_border $color18;\
    keyword general:gaps_out 5"

    #hyprlock
    HYPRLOCK_SOURCE="$HOME/.config/ThemePicker/gray-theme/hyprlock.conf"
    if [ -f "$HYPRLOCK_SOURCE" ]; then
        cp "$HYPRLOCK_SOURCE" "$hyprlock_config" ||{
            echo "failed to copy $HYPRLOCK_SOURCE  to $hyprlock_config"
            exit 1 
        }
        echo "Succesfully copied $HYPRLOCK_SOURCE to $hyprlock_config"
    else
        echo "file $HYPRLOCK_SOURCE not found"
        exit 1
    fi



$scriptsluis/wallpapergray.sh


#wallust.conf source y destino
SOURCE="$HOME/.config/ThemePicker/gray-theme/wallust-hyprland.conf"
DEST="$HOME/.config/hypr/wallust/"

# exsite?
if [ -f "$SOURCE" ]; then

  # cp
    cp "$SOURCE" "$DEST/" || {
        echo "failed to copy $SOURCE to $DEST"
        exit 1
    }
    echo "successfully copied $SOURCE to $DEST"
else
    echo "source file $SOURCE does not exist"
    exit 1
fi



#rofi themeinsta
gray_theme="$HOME/.config/ThemePicker/gray-theme/rofi-theme/gray.rasi"
current_theme="$HOME/.config/rofi/config.rasi"

    if [ -f "$gray_theme" ]; then
    

        cp "$gray_theme" "$current_theme" || {
        echo "could not switch to gray theme"
        exit 1
        } 
        echo "switched to gray theme"
    else
        echo "could not switch to gray theme, $gray_theme does nto exist"
        exit 1
    fi

#cambiar el gtk theme
    echo "Setting GTK theme to $nordicdarker"
    gsettings set org.gnome.desktop.interface gtk-theme "Nordic-darker"
                    
# Export settings to $HOME/.config/gtk-3.0/settings.ini for XWayland compatibility
    echo "Exporting settings to $HOME/.config/gtk-3.0/settings.ini"
    nwg-look -x

# Verify the theme was applied
    CURRENT_THEME=$(gsettings get org.gnome.desktop.interface gtk-theme)
        if [ "$CURRENT_THEME" == "'$nordicdarker'" ]; then
            echo "Successfully changed GTK theme to $nordicdarker"
        else
            echo "Error: Failed to change GTK theme. Current theme is $nordicdarker"
        exit 1
        fi

fi



#nord theme
if [[ "$1" == "nord" ]]; then
hyprctl --batch "\
    keyword general:col.active_border $color17;\
    keyword general:col.inactive_border $color18;\
    keyword general:gaps_out 5"


    #hyprlock
    HYPRLOCK_SOURCE="$HOME/.config/ThemePicker/nord-theme/hyprlock.conf"
    if [ -f "$HYPRLOCK_SOURCE" ]; then
        cp "$HYPRLOCK_SOURCE" "$hyprlock_config" ||{
            echo "failed to copy $HYPRLOCK_SOURCE  to $hyprlock_config"
            exit 1 
        }
        echo "Succesfully copied $HYPRLOCK_SOURCE to $hyprlock_config"
    else
        echo "file $HYPRLOCK_SOURCE not found"
        exit 1
    fi

    $scriptsluis/wallpapernord.sh

#wallust source yd estino
    SOURCE="$HOME/.config/ThemePicker/nord-theme/wallust-hyprland.conf"
    DEST="$HOME/.config/hypr/wallust/"

# exsite?
    if [ -f "$SOURCE" ]; then

  # cp
    cp "$SOURCE" "$DEST/" || {
        echo "failed to copy $SOURCE to $DEST"
        exit 1
    }
    echo "successfully copied $SOURCE to $DEST"
    else
    echo "source file $SOURCE does not exist"
    exit 1
    fi



#rofi theme
nord_theme="$HOME/.config/ThemePicker/nord-theme/rofi-theme/nord.rasi"
current_theme="$HOME/.config/rofi/config.rasi"

    if [ -f "$nord_theme" ]; then
    

        cp "$nord_theme" "$current_theme" || {
        echo "could not switch to nord theme"
        exit 1
        } 
        echo "switched to nord theme"
    else
        echo "could not switch to nord theme, $nord_theme does nto exist"
        exit 1
    fi

#cambiar el gtk theme
    echo "Setting GTK theme to $nordicdarker"
    gsettings set org.gnome.desktop.interface gtk-theme "Nordic-darker"
                    
# Export settings to $HOME/.config/gtk-3.0/settings.ini for XWayland compatibility
    echo "Exporting settings to $HOME/.config/gtk-3.0/settings.ini"
    nwg-look -x

# Verify the theme was applied
    CURRENT_THEME=$(gsettings get org.gnome.desktop.interface gtk-theme)
        if [ "$CURRENT_THEME" == "'$nordicdarker'" ]; then
            echo "Successfully changed GTK theme to $nordicdarker"
        else
            echo "Error: Failed to change GTK theme. Current theme is $nordicdarker"
        exit 1
        fi

fi



#Chicago theme

if [[ "$1" == "Chicago-95" ]]; then

    $scriptsluis/wallpaperchicago.sh

#wallust source yd estino
SOURCE="$HOME/.config/ThemePicker/chicago-theme/wallust-hyprland.conf"
DEST="$HOME/.config/hypr/wallust/"

# exsite?
    if [ -f "$SOURCE" ]; then

  # cp
    cp "$SOURCE" "$DEST/" || {
        echo "failed to copy $SOURCE to $DEST"
        exit 1
    }
    echo "successfully copied $SOURCE to $DEST"
    else
    echo "source file $SOURCE does not exist"
    exit 1
    fi

#rofi theme
Chicago95_theme="$HOME/.config/ThemePicker/chicago-theme/rofi-theme/chicago.rasi"
current_theme="$HOME/.config/rofi/config.rasi"

    if [ -f "$Chicago95_theme" ]; then
    

        cp "$Chicago95_theme" "$current_theme" || {
        echo "could not switch to Chicago 95 theme"
        exit 1
        } 

        echo "switched to Chicago 95 theme"
    else
        echo "could not switch to Chicago 95 theme, $Chicago95_theme does nto exist"
        exit 1
    fi

#cambiar el gtk theme
    echo "Setting GTK theme to $chicago95"
    gsettings set org.gnome.desktop.interface gtk-theme "Chicago95"
                    
# Export settings to $HOME/.config/gtk-3.0/settings.ini for XWayland compatibility
    echo "Exporting settings to $HOME/.config/gtk-3.0/settings.ini"
    nwg-look -x

# Verify the theme was applied
    CURRENT_THEME=$(gsettings get org.gnome.desktop.interface gtk-theme)
        if [ "$CURRENT_THEME" == "'$chicago95'" ]; then
            echo "Successfully changed GTK theme to $chicago95"
        else
            echo "Error: Failed to change GTK theme. Current theme is $chicago95"
        exit 1
        fi



fi
