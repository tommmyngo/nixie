{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local config = wezterm.config_builder()
      config.front_end = "WebGpu"
      config.enable_wayland = false

      config.color_scheme = "Horizon Dark (Gogh)"
      config.font = wezterm.font "GeistMono Nerd Font"

      return config
    '';
  };
}
