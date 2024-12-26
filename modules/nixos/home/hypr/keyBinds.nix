{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # Terminal
      "SUPER_CTRL_ALT,             Return, exec, $TERMINAL"
      # App Launcher
      "ALT,             Space,  exec, $LAUNCHER"

      # Apps Shortcuts
      "SUPER_CTRL_ALT,  C, exec, $BROWSER"
      "SUPER_CTRL_ALT,  V, exec, $EDITOR"
      "SUPER_CTRL_ALT,  S, exec, spotify"

      # Layouts - not used much
      # "SUPER,           G, togglegroup"
      # "SUPER,           H, changegroupactive, b"
      # "SUPER,           L, changegroupactive, f"
      # "SUPER_SHIFT,     L, lockactivegroup, toggle"

      # Hyprland
      "ALT,             Q,      killactive,"
      "CTRL_SHIFT,      Q,      exit,"
      "CTRL_SHIFT,      B,      exec, ags quit -i astal ; ags run $BAR_PATH"
      "SUPER,           F,      fullscreen, 0"
      "SUPER,           S,      pseudo,"
      "SUPER,           Space,  togglefloating,"
      "SUPER,           Space,  centerwindow,"
      "ALT,             E,      exec, $EMOJI"

      # Switching Workspaces and moving to Workspaces
      "SUPER,             1,  workspace, 1"
      "SUPER,             2,  workspace, 2"
      "SUPER,             3,  workspace, 3"
      "SUPER,             4,  workspace, 4"
      "SUPER,             5,  workspace, 5"
      "SUPER,             6,  workspace, 6"
      "SUPER,             7,  workspace, 7"
      "SUPER,             8,  workspace, 8"
      "SUPER,             A,  workspace, e-1"
      "SUPER,             D,  workspace, e+1"
      "SUPER_SHIFT,       1,  movetoworkspace, 1"
      "SUPER_SHIFT,       2,  movetoworkspace, 2"
      "SUPER_SHIFT,       3,  movetoworkspace, 3"
      "SUPER_SHIFT,       4,  movetoworkspace, 4"
      "SUPER_SHIFT,       5,  movetoworkspace, 5"
      "SUPER_SHIFT,       6,  movetoworkspace, 6"
      "SUPER_SHIFT,       7,  movetoworkspace, 7"
      "SUPER_SHIFT,       8,  movetoworkspace, 8"
      "SUPER_SHIFT,       A,  movetoworkspace, e-1"
      "SUPER_SHIFT,       D,  movetoworkspace, e+1"

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

      # Change Workspace Mode
      "SUPER_CTRL,      F, workspaceopt, allfloat"
      "SUPER_CTRL,      S, workspaceopt, allpseudo"
    ];
    bindm = [
      # Mouse button
      "SUPER,           mouse:272, movewindow"
      "SUPER,           mouse:273, resizewindow"
    ];
    binde = [
      # Resize Active
      "SUPER_CTRL,      left,  resizeactive, -20 0"
      "SUPER_CTRL,      right, resizeactive, 20 0"
      "SUPER_CTRL,      up,    resizeactive, 0 -20"
      "SUPER_CTRL,      down,  resizeactive, 0 20"

      # Move Active (Floating Only)
      "SUPER_ALT,       left,  moveactive, -20 0"
      "SUPER_ALT,       right, moveactive, 20 0"
      "SUPER_ALT,       up,    moveactive, 0 -20"
      "SUPER_ALT,       down,  moveactive, 0 20"
    ];
  };
}
