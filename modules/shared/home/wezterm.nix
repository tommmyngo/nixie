{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local config = wezterm.config_builder()
      config.front_end = "WebGpu"
      config.color_scheme = "Horizon"
      config.font = wezterm.font("GeistMono Nerd Font", { weight = "Regular" })

      return config
    '';
  };
}
