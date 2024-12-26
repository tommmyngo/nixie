{
  config,
  pkgs,
  lib,
  ...
}: let
  user = "nommy";
  shared-programs = import ../shared/home-manager.nix {inherit config pkgs lib;};
in {
  home = {
    enableNixpkgsReleaseCheck = false;
    username = "${user}";
    homeDirectory = "/home/${user}";
    packages = pkgs.callPackage ./packages.nix {};
    stateVersion = "24.11";
  };

  services = {
    # Auto mount devices
    udiskie.enable = true;
  };

  programs = shared-programs // {};
}
