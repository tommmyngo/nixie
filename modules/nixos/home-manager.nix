{
  pkgs,
  inputs,
  ...
}: let
  user = "nommy";
  shared-programs = import ../shared/home-manager.nix {inherit inputs pkgs;};
in {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
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

  programs = shared-programs;
}
