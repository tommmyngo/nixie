{
  pkgs,
  lib,
  ...
}: let
  user = "nommy";
  wimst = import ./sddm.nix {inherit pkgs;};
  shared-packages = import ../../modules/shared/packages.nix {inherit pkgs;};
in {
  imports = [
    ../../modules/nixos/disk-config.nix
    ../../modules/nixos/system
    ../../modules/shared
  ];

  time.timeZone = "America/Denver";
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
      allowed-users = ["${user}"];
      trusted-users = ["@admin" "${user}"];
    };
    gc = {
      dates = "weekly";
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
        extraPackages = [wimst];
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

    blueman = {
      enable = true;
    };
  };
  hardware = {
    pulseaudio.enable = false;
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
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

  environment.systemPackages =
    [
      wimst
    ]
    ++ shared-packages;

  system.stateVersion = "24.11";
}
