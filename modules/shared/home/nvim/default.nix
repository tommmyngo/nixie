{
  programs.neovim = {
    enable = true;
    # defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
  home.file = {
    "./.config/lazyvim/" = {
      enable = false;
      source = ./lazyvim;
      recursive = true;
    };
  };
}
