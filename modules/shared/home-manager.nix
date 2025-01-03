{
  pkgs,
  inputs,
  ...
}: let
in {
  imports = [
    inputs.ghostty.homeModules.default
    ./home
  ];
  home = {
    enableNixpkgsReleaseCheck = false;
    packages = import ./packages.nix {inherit pkgs;};
    stateVersion = "24.11";
  };
}
