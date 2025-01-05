{pkgs, ...}: {
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowBroken = true;
      allowInsecure = false;
      allowUnsupportedSystem = true;
    };
  };
  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      substituters = ["https://nix-community.cachix.org" "https://cache.nixos.org" "https://hyprland.cachix.org"];
      trusted-public-keys = ["cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };
    optimise.automatic = true;
    gc = {
      automatic = true;
      options = "--delete-older-than 3d";
    };
  };
  fonts.packages = with pkgs; [
    nerd-fonts.symbols-only
    nerd-fonts.geist-mono
    noto-fonts-emoji
    geist-font
  ];
  environment.variables = {
    EDITOR = "code";
    NVIM_APPNAME = "lazyvim";
  };
}
