{
  pkgs,
  lib,
  ...
}: let
  user = "nommy";
  where-is-my-sddm-theme = import ./sddm.nix {inherit pkgs;};
in {
  imports = [
    ../../modules/nixos/disk-config.nix
    ../../modules/nixos/system
    ../../modules/shared
  ];

  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  networking = {
    hostName = "hako";
    networkmanager.enable = true;
    useDHCP = lib.mkDefault false;
    interfaces."wlp2s0".useDHCP = true;
  };

  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
      allowed-users = ["${user}"];
      trusted-users = ["@admin" "${user}"];
      substituters = ["https://nix-community.cachix.org" "https://cache.nixos.org" "https://hyprland.cachix.org"];
      # trusted-public-keys = ["cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };
    optimise.automatic = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 5d";
    };
  };

  programs = {
    zsh.enable = true;
    nh.enable = true;
    hyprland.enable = true;
  };

  services = {
    getty.autologinUser = "nommy";
    displayManager = {
      defaultSession = "hyprland";
      sddm = {
        enable = true;
        wayland.enable = true;
        extraPackages = [where-is-my-sddm-theme];
        theme = "where_is_my_sddm_theme_qt5";
      };
    };
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
      };
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
  hardware = {
    pulseaudio.enable = false;
  };

  users.users = {
    ${user} = {
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      shell = pkgs.zsh;
    };
  };

  users.defaultUserShell = pkgs.zsh;

  security.rtkit.enable = true;
  # Don't require password for users in `wheel` group for these commands
  security.sudo = {
    enable = true;
    extraRules = [
      {
        commands = [
          {
            command = "ALL";
            options = ["NOPASSWD"];
          }
        ];
        groups = ["wheel"];
      }
    ];
  };

  environment.systemPackages = [
    where-is-my-sddm-theme
  ];

  system.stateVersion = "24.11";
}
