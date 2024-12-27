{
  ags,
  pkgs,
  ...
}: {
  imports = [
    ags.homeManagerModules.default
  ];

  programs.ags = {
    enable = true;
    configDir = null;

    # Additional packages to add to GJS's runtime
    extraPackages =
      [
      ]
      ++ (with ags.packages.${pkgs.system}; [
        hyprland
        powerprofiles
        network
        wireplumber
        mpris
        notifd
        bluetooth
        tray
      ]);
  };
}
