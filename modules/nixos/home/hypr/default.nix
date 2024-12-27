{hyprland, ...}: {
  imports = [
    hyprland.homeManagerModules.default

    ./animations.nix
    ./cursor.nix
    ./decoration.nix
    ./execOnce.nix
    ./general.nix
    ./input.nix
    ./keyBinds.nix
    ./layouts.nix
    ./misc.nix
    ./monitor.nix
    ./windowrule.nix
    ./workspace.nix
  ];

  wayland.windowManager.hyprland.enable = true;
}
