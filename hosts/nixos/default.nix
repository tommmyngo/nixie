{
  pkgs,
  lib,
  config,
  ...
}: let
  user = "nommy";
  keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOk8iAnIaa1deoc7jw8YACPNVka1ZFJxhnU4G74TmS+p"];
  where-is-my-sddm-theme = import ./sddm.nix {inherit pkgs;};
in {
  imports = [
    # ../../modules/nixos/disk-config.nix
    ../../modules/nixos/system
    ../../modules/shared
  ];

  # Use the systemd-boot EFI boot loader.
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 42;
      };
      efi.canTouchEfiVariables = true;
    };
    initrd.availableKernelModules = ["xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod"];
    # Uncomment for AMD GPU
    # initrd.kernelModules = ["amdgpu"];
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = ["uinput" "kvm-amd"];
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/947f0c5c-5524-4a00-b62b-e52bfbe4485d";
    fsType = "ext4";
  };
  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/0CE6-E0AC";
    fsType = "vfat";
    options = ["fmask=0077" "dmask=0077"];
  };
  swapDevices = [
    {device = "/dev/disk/by-uuid/27f7d214-f08c-4d84-b064-2b01bd89cb29";}
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
    # The global useDHCP flag is deprecated, therefore explicitly set to false here.
    # Per-interface useDHCP will be mandatory in the future, so this generated config
    # replicates the default behaviour. TODO
    useDHCP = lib.mkDefault true;
  };

  # Turn on flag for proprietary software
  nix = {
    nixPath = ["nixie=/home/${user}/.local/share/src/nixie:/etc/nixos:/home/nommy/nixie"];
    settings = {
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
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
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

      layout = "us";
      xkb = {
        layout = "us";
      };
      xkbOptions = "ctrl:nocaps";

      # Better support for general peripherals
      libinput.enable = true;
    };

    printing.enable = true;

    # Audio
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
  security.rtkit.enable = true;
  # Video support
  hardware = {
    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    pulseaudio.enable = false;
    # hardware.nvidia.modesetting.enable = true;
  };

  # It's me, it's you, it's everyone
  users.users = {
    ${user} = {
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "wheel" # Enable ‘sudo’ for the user.
        "docker"
      ];
      shell = pkgs.zsh;
      openssh.authorizedKeys.keys = keys;
    };

    root = {
      openssh.authorizedKeys.keys = keys;
    };
  };

  users.defaultUserShell = pkgs.zsh;

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
    FLAKE = "/home/nommy/nixes";
    BAR_PATH = "$FLAKE/home-manager/$HOST/config/ags";
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
