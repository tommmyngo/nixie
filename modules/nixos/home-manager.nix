{
  pkgs,
  inputs,
  ...
}: let
  user = "nommy";
in {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ../shared/home-manager.nix
    ./home
  ];
  home = {
    enableNixpkgsReleaseCheck = false;
    username = "${user}";
    homeDirectory = "/home/${user}";
    packages = pkgs.callPackage ./packages.nix {};
    stateVersion = "24.11";
  };

  services = {
    udiskie.enable = true;
  };

  programs.nixvim.enable = true;
}
