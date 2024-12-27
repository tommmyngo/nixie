{
  environment.sessionVariables = {
    FLAKE = "/home/nommy/nixie";
    BAR_PATH = "$FLAKE/modules/nixos/home/ags";
    WALL_PATH = "$FLAKE/walls/sushi.jpg";

    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";

    TERMINAL = "kitty";
    BROWSER = "google-chrome-stable";
    EDITOR = "code";
    LAUNCHER = "rofi -show drun";
    EMOJI = "rofi -modi emoji:rofimoji -show emoji";
  };
}
