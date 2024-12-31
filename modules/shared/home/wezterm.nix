{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local config = wezterm.config_builder()
      config.front_end = "WebGpu"
      config.enable_wayland = false

      config.color_scheme = "Horizon Dark (base16)"
      config.font = wezterm.font "GeistMono Nerd Font"
      config.window_background_opacity = 0.9
      config.hide_tab_bar_if_only_one_tab = true
      config.tab_bar_at_bottom = true

      config.window_frame = {
        active_titlebar_bg = 'none',
        inactive_titlebar_bg = 'none',
      }
      config.window_decorations = "RESIZE"

      config.colors = {
        tab_bar = {
          background = 'none',
          inactive_tab = {
            bg_color = '#1c1e26',
            fg_color = '#FFFFFF',
          },
          active_tab = {
            bg_color = '#1c1e26',
            fg_color = '#ee64ac',
          },
        },
      }

      config.window_padding = {
        left = 24,
        right = 16,
        top = 16,
        bottom =16,
      }

      return config
    '';
  };
}
