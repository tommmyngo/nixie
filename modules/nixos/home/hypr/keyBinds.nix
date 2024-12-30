{
  wayland.windowManager.hyprland.settings = {
    bind = [
      "ALT,             Space,  exec, rofi -show drun"

      # Launching Applications
      "CTRL_ALT,        C,      exec, google-chrome-stable"
      "CTRL_ALT,        V,      exec, code"
      "CTRL_ALT,        S,      exec, spotify"
      "CTRL_ALT,        Return, exec, alacritty"
      "CTRL_ALT,        E,      exec, $EMOJI"

      # Hyprland
      "CTRL_SHIFT,      E,      exit,"
      "CTRL_SHIFT,      B,      exec, ags quit -i astal ; ags run $BAR_PATH"

      "CTRL_SUPER,      M,      fullscreen, 0"
      "CTRL_SUPER,      S,      pseudo,"
      "SHIFT,           Space,  togglefloating,"
      "SHIFT,           Space,  centerwindow,"
      "ALT,             Q,      killactive,"

      # Switching Workspaces and moving to Workspaces
      "ALT,             1,  workspace, 1"
      "ALT,             2,  workspace, 2"
      "ALT,             3,  workspace, 3"
      "ALT,             4,  workspace, 4"
      "ALT,             5,  workspace, 5"
      "ALT,             6,  workspace, 6"
      "ALT,             7,  workspace, 7"
      "ALT,             8,  workspace, 8"
      "ALT,             H,  workspace, e-1"
      "ALT,             L,  workspace, e+1"
      "ALT_SHIFT,       1,  movetoworkspace, 1"
      "ALT_SHIFT,       2,  movetoworkspace, 2"
      "ALT_SHIFT,       3,  movetoworkspace, 3"
      "ALT_SHIFT,       4,  movetoworkspace, 4"
      "ALT_SHIFT,       5,  movetoworkspace, 5"
      "ALT_SHIFT,       6,  movetoworkspace, 6"
      "ALT_SHIFT,       7,  movetoworkspace, 7"
      "ALT_SHIFT,       8,  movetoworkspace, 8"
      "ALT_SHIFT,       H,  movetoworkspace, e-1"
      "ALT_SHIFT,       L,  movetoworkspace, e+1"

      # Moving windows within layout - Vim
      "SUPER,             H,  movefocus, l"
      "SUPER,             L,  movefocus, r"
      "SUPER,             K,  movefocus, u"
      "SUPER,             J,  movefocus, d"
      "SUPER_SHIFT,       H,  movewindow, l"
      "SUPER_SHIFT,       L,  movewindow, r"
      "SUPER_SHIFT,       K,  movewindow, u"
      "SUPER_SHIFT,       J,  movewindow, d"

      # Switch between last window/workspace
      "ALT,             Tab, focuscurrentorlast,"
      "ALT,             Tab, bringactivetotop,"
    ];
    bindm = [
      # Mouse move and resize with button
      "SUPER,           mouse:272, movewindow"
      "SUPER,           mouse:273, resizewindow"
    ];
    binde = [
      # Resize Active
      "SUPER_CTRL,      h,  resizeactive, -20% 0"
      "SUPER_CTRL,      l, resizeactive, 20% 0"
      "SUPER_CTRL,      k,    resizeactive, 0 -20%"
      "SUPER_CTRL,      j,  resizeactive, 0 20%"
    ];
  };
}
