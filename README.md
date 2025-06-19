# ThemeChanger
theme changer for hyprland
just drag the files into your /.config/ file and everything should kind of work with these pictures, theres also a commented section in the themepicker.sh to use wallust colors for absolutely everything, but i couldnt get it to work was i wanted it, so you can use that if you wish, just comment the $scriptsluis/wallpapertheme.sh and add a
    
    set_wallpaper "$theme_wallpaper"
    EXCEPT NORD, NORD HAS TO BE $nordwallpaper
i made it to use it with jakoolits hyprdots, its going to requiere the following commands to make the files executable

    chmod +x ~/.config/ThemePicker/scripts/wallpapergray.sh
    chmod +x ~/.config/ThemePicker/scripts/wallpapernord.sh
    chmod +x ~/.config/ThemePicker/scripts/wallpaperbeige.sh
    chmod +x ~/.config/ThemePicker/ThemePickerMain.Py


youre also going to need to add this keybind to your userkeybinds.conf to make it a lil bit more comfortable to use

    #ThemePicker
    bind = $mainMod CTRL SHIFT, B, exec, python $HOME/.config/ThemePicker/ThemePickerMain.py
