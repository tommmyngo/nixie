{pkgs}:
with pkgs; let
  shared-packages = import ../shared/packages.nix {inherit pkgs;};
in
  shared-packages
  ++ [
    dart-sass
    rofimoji
    swww
    gammastep
    librewolf-wayland
  ]
