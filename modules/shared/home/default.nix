{
  imports = [
    ./fastfetch.nix
    ./git.nix
    ./nvim
    ./starship.nix
    ./wezterm.nix
    ./yazi.nix
    ./zsh.nix
  ];
  programs.eza.enable = true;
  programs.zoxide.enable = true;
  programs.fzf.enable = true;
  programs.fzf.enableBashIntegration = false;
  programs.fzf.enableZshIntegration = false;
  programs.lazygit.enable = true;
  programs.fd.enable = true;
  programs.ripgrep.enable = true;
  programs.bun.enable = true;
  programs.btop.enable = true;
}
