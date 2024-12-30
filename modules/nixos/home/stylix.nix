{pkgs, ...}: {
  stylix = {
    enable = true;
    iconTheme = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
    };

    targets = {
      hyprpaper.enable = false;
      hyprland.hyprpaper.enable = false;
      vscode.enable = false;
      alacritty.enable = false;
      wezterm.enable = false;
    };
  };
}
