{pkgs, ...}: let
  user = "nommy";
  shared-packages = import ../../modules/shared/packages.nix {inherit pkgs;};
in {
  imports = [
    ../../modules/darwin/system
    ../../modules/shared
  ];

  users.users.${user} = {
    name = "${user}";
    home = "/Users/${user}";
    isHidden = false;
    shell = pkgs.zsh;
  };

  services.nix-daemon.enable = true;

  nix = {
    gc = {
      user = "root";
      interval = {
        Weekday = 0;
        Hour = 2;
        Minute = 0;
      };
    };
    settings = {
      trusted-users = ["@admin" "${user}"];
    };
  };

  system.checks.verifyNixPath = false;

  environment.systemPackages = with pkgs;
    [
    ]
    ++ shared-packages;

  system = {
    stateVersion = 5;

    defaults = {
      NSGlobalDomain = {
        NSAutomaticCapitalizationEnabled = false;
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        AppleInterfaceStyle = "Dark";
        KeyRepeat = 2; # Values: 120, 90, 60, 30, 12, 6, 2
        InitialKeyRepeat = 15; # Values: 120, 94, 68, 35, 25, 15

        "com.apple.sound.beep.volume" = 1.0;
        "com.apple.sound.beep.feedback" = 1;
        "com.apple.swipescrolldirection" = false;
      };

      WindowManager = {
        EnableStandardClickToShowDesktop = false;
        StageManagerHideWidgets = true;
        StandardHideDesktopIcons = true;
        StandardHideWidgets = true;
      };
      controlcenter = {
        BatteryShowPercentage = true;
      };
      dock = {
        autohide = true;
        show-recents = false;
        launchanim = false;
        orientation = "bottom";
        tilesize = 12;
      };
      finder = {
        _FXShowPosixPathInTitle = false;
        _FXSortFoldersFirst = true;
        _FXSortFoldersFirstOnDesktop = true;
        FXPreferredViewStyle = "Nlsv";
        ShowStatusBar = true;
        ShowPathbar = true;
      };
      loginwindow = {GuestEnabled = false;};
      trackpad = {
        ActuationStrength = 0;
      };
    };
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };
  };
}
