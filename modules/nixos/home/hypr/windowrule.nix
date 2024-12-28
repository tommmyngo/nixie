{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "workspace 1, class:^(Google-chrome)$"
      "workspace 2, class:^(Code)$"
      "workspace 3, class:^(Alacritty)$"
      "suppressevent maximize, class:.*"
      "nofocus, class:^$, title:^$, xwayland:1, floating:1, fullscreen:0, pinned:0"

      # Opacity overrides
      "opacity 0.9 override, class:^(Code)$"
      "opacity 0.9 override, class:^(Spotify)$"
      "opacity 0.9 override, class:^(Google-chrome)$"
      "opacity 1.0 override, class:^(Google-chrome)$, title:^(.*(?:- YouTube)).*$"
    ];
  };
}
