{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      # Wallpaper
      "swww-daemon & swww img $FLAKE/walls/sushi.jpg"
      "ags run $BAR_PATH"
      "gammastep -O 4500"
    ];
  };
}
