{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      # Wallpaper
      "swww-daemon & swww img $WALL_PATH"
      "ags run $BAR_PATH"
    ];
  };
}
