{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: let
  shared-home-programs = import ../shared/home-manager.nix {inherit config pkgs lib inputs;};
in {
  imports = [
    ./home
    ./system
  ];
}
