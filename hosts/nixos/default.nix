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
    nixPath = ["nixos-config=/home/${user}/.local/share/src/nixos-config:/etc/nixos:/home/nommy/nixie"];
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
      allowed-users = ["${user}"];
      trusted-users = ["@admin" "${user}"];
      substituters = ["https://nix-community.cachix.org" "https://cache.nixos.org"];
      trusted-public-keys = ["cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="];
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
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  # It's me, it's you, it's everyone
  users.users = {
    ${user} = {
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "wheel" # Enable ‘sudo’ for the user.
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

  environment.sessionVariables = {
    FLAKE = "/home/nommy/nixie";
    BAR_PATH = "$FLAKE/modules/nixos/home/ags";
    WALL_PATH = "$FLAKE/walls/sushi.jpg";

    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";

    TERMINAL = "kitty";
    BROWSER = "google-chrome-stable";
    EDITOR = "code";
    LAUNCHER = "rofi -show drun";
    EMOJI = "rofi -modi emoji:rofimoji -show emoji";
  };
  system.stateVersion = "24.11";
}
