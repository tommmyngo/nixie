{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: let
  user = "nommy";
  shared-home-programs = import ../shared/home-manager.nix {inherit config pkgs lib inputs;};
in {
  imports = [
    ./dock.nix
  ];

  users.users.${user} = {
    name = "${user}";
    home = "/Users/${user}";
    isHidden = false;
    shell = pkgs.zsh;
  };

  homebrew = {
    enable = true;
    casks = import ./casks.nix;
    # onActivation.cleanup = "uninstall";

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

  # Enable home-manager
  home-manager = {
    users.${user} = {pkgs, ...}: {
      home = {
        enableNixpkgsReleaseCheck = false;
        packages = import ./packages.nix {inherit pkgs;};
        stateVersion = "24.11";
      };
      programs = shared-home-programs;

      # Marked broken Oct 20, 2022 check later to remove this
      # https://github.com/nix-community/home-manager/issues/3344
      manual.manpages.enable = false;
    };
  };

  # Fully declarative dock using the latest from Nix Store
  local.dock.enable = true;
  local.dock.entries = [
    # {path = "/System/Applications/Messages.app/";}
    # {path = "/System/Applications/Photos.app/";}
  ];
}
