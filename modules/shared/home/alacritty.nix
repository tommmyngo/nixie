{
  programs = {
    alacritty = {
      enable = true;
      settings = {
        general = {
          import = [
            "~/nixie/horizon_dark.toml"
          ];
        };

        font = {
          size = 12;
          normal = {
            family = "GeistMono Nerd Font";
            style = "Regular";
          };
        };

        window = {
          decorations = "None";
          opacity = 0.9;
          padding = {
            x = 24;
            y = 16;
          };
          dynamic_padding = true;
          blur = true;
        };
      };
    };
  };
}
