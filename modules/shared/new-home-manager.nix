{
  pkgs,
  inputs,
  ...
}: let
  shared-home-programs = import ./home {inherit pkgs inputs;};
in {
  imports = [
    ./new-home
  ];
  home = {
    enableNixpkgsReleaseCheck = false;
    packages = import ./packages.nix {inherit pkgs;};
    stateVersion = "24.11";
  };
  programs = shared-home-programs;
}
