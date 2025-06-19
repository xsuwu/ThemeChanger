# ThemeChanger
theme changer for hyprland
i made it to use it with jakoolits hyprdots, its going to requiere the following commands to make the files executable

    chmod +x ~/.config/ThemePicker/scripts/wallpapergray.sh
    chmod +x ~/.config/ThemePicker/scripts/wallpapernord.sh
    chmod +x ~/.config/ThemePicker/scripts/wallpaperbeige.sh
    chmod +x ~/.config/ThemePicker/ThemePickerMain.Py


youre also going to need to add this keybind to your userkeybinds.conf to make it a lil bit more comfortable to use

    #ThemePicker
    bind = $mainMod CTRL SHIFT, B, exec, python $HOME/.config/ThemePicker/ThemePickerMain.py
