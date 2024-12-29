{
  imports = [
    ./dock.nix
    ./jankyborders.nix
    ./aerospace.nix
  ];

  homebrew = {
    enable = true;
    casks = import ./casks.nix {};

    # These app IDs are from using the mas CLI app
    # mas = mac app store
    # https://github.com/mas-cli/mas
    #
    # $ nix shell nixpkgs#mas
    # $ mas search <app name>
    #
    # If you have previously added these apps to your Mac App Store profile (but not installed them on this system),
    # you may receive an error message "Redownload Unavailable with This Apple ID".
    # This message is safe to ignore. (https://github.com/dustinlyons/nixos-config/issues/83)
    masApps = {
      #  "1password" = 1333542190;
      #  "wireguard" = 1451685025;
    };
  };

  # Fully declarative dock using the latest from Nix Store
  local.dock.enable = true;
  local.dock.entries = [
    # {path = "/System/Applications/Messages.app/";}
    # {path = "/System/Applications/Photos.app/";}
  ];
}
