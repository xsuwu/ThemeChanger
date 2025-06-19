# ThemeChanger
theme changer for hyprland
just drag the ThemePicker folder into your /.config/ file, and the 2 themes from the theme folder into .themes, if you already have them theres no need, and everything should kind of work if you have the default jakoolit dot files, except for the being centered and floating part.
    Theres also a commented section in the themepicker.sh to use wallust colors for absolutely everything, but i couldnt get it to work as i wanted it, so you can use that if you wish, just comment the         $scriptsluis/wallpapertheme.sh and add a 
    
    set_wallpaper "$theme_wallpaper"
    EXCEPT NORD, NORD HAS TO BE $nordwallpaper
i made it to use it with jakoolits hyprdots, its going to requiere the following commands to make the files executable

    chmod +x ~/.config/ThemePicker/scripts/themepicker.sh
    chmod +x ~/.config/ThemePicker/scripts/wallpapergray.sh
    chmod +x ~/.config/ThemePicker/scripts/wallpapernord.sh
    chmod +x ~/.config/ThemePicker/scripts/wallpaperbeige.sh
    chmod +x ~/.config/ThemePicker/ThemePickerMain.Py


youre also going to need to add this keybind to your userkeybinds.conf to make it a lil bit more comfortable to use

    #ThemePicker
    bind = $mainMod CTRL SHIFT, B, exec, python $HOME/.config/ThemePicker/ThemePickerMain.py
and this ones to your windowrules to make it pop up in the center
    
    #ThemePicker
    windowrule = float, title: ^(Choosee)$
    windowrule = center, title: ^(Choosee)$
    

**warning**!
i think that running it for the first time will replace the file that is currently being used as a wallpaper, so make  a copy of your current wallpaper just in case, ill probably fix that someday

