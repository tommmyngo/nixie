{
  programs.neovim = {
    enable = true;
    # defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
  home.file = {
    "./.config/nvim/" = {
      # enable = false;
      source = ./lazy;
      recursive = true;
    };
  };
}
