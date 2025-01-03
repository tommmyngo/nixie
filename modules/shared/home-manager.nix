{pkgs, ...}: let
in {
  imports = [
    ./home
  ];
  home = {
    enableNixpkgsReleaseCheck = false;
    packages = import ./packages.nix {inherit pkgs;};
    stateVersion = "24.11";
  };
}
