{pkgs, ...}:
{
  eza.enable = true;
  zoxide.enable = true;
}
# Kitty broken on Darwin - using alacritty instead
// import ./alacritty.nix
// import ./bun.nix
// import ./btop.nix
// import ./fastfetch.nix
// import ./firefox.nix {inherit pkgs;}
// import ./zsh.nix
// import ./git.nix
// import ./vscode.nix {inherit pkgs;}
// import ./yazi.nix
// import ./starship.nix
