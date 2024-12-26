{pkgs, ...}: {
  stylix = {
    enable = true;

    # base16Scheme = "${pkgs.base16-schemes}/share/themes/horizon-dark.yaml";
    base16Scheme = ../../../neo-horizon.yaml;

    # Comment out base16Scheme to let Stylix generate scheme based on Wallpaper
    image = ../../../walls/sushi.jpg;

    cursor = {
      name = "BreezeX-RosePine-Linux";
      package = pkgs.rose-pine-cursor;
      size = 32;
    };

    fonts = rec {
      monospace = {
        package = pkgs.nerd-fonts.geist-mono;
        name = "GeistMono Nerd Font";
      };
      sansSerif = {
        package = pkgs.geist-font;
        name = "Geist";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
      serif = sansSerif;
    };

    opacity = {
      applications = 0.9;
      desktop = 0.9;
      popups = 0.9;
      terminal = 0.9;
    };

    polarity = "dark";

    iconTheme = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
    };
  };
}
