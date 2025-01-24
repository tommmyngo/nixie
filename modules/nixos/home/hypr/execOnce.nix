{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      # Wallpaper
      "swww-daemon & swww img $FLAKE/walls/kanji.png"
      "ags run $BAR_PATH"
      "gammastep -O 4500"
    ];
  };
}
