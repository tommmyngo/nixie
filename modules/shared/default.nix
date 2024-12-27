{pkgs, ...}: {
  nixpkgs = {
    config = {
      allowUnfree = true;
      # allowBroken = true;
      # allowInsecure = false;
      # allowUnsupportedSystem = true;
    };
  };
  fonts.packages = with pkgs; [
    nerd-fonts.symbols-only
    nerd-fonts.geist-mono
    noto-fonts-emoji
    geist-font
  ];
}
