{
  alacritty = {
    enable = true;
    settings = {
      colors.bright = {
        black = "#6f6f70";
        blue = "#df5273";
        cyan = "#24a8b4";
        green = "#a4e990";
        magenta = "#b072d1";
        red = "#e4a382";
        white = "#e3e6ee";
        yellow = "#b072d1";
      };
      colors.cursor = {
        cursor = "#ffe6e0";
        text = "#0b0c0f";
      };
      colors.normal = {
        black = "#0b0c0f";
        blue = "#df5273";
        cyan = "#24a8b4";
        green = "#a4e990";
        magenta = "#b072d1";
        red = "#e4a382";
        white = "#ffe6e0";
        yellow = "#b072d1";
      };

      colors.primary = {
        background = "#0b0c0f";
        bright_foreground = "#e3e6ee";
        foreground = "#ffe6e0";
      };

      colors.selection = {
        background = "#2e303e";
        text = "#ffe6e0";
      };

      font = {
        size = 12;
        normal = {
          family = "GeistMono Nerd Font";
          style = "Regular";
        };
      };

      window = {
        opacity = 0.9;
        padding = {
          x = 32;
          y = 16;
        };
        dynamic_padding = true;
        blur = true;
      };
    };
  };
}
