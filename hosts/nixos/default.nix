{pkgs, ...}: let
  user = "nommy";
  keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOk8iAnIaa1deoc7jw8YACPNVka1ZFJxhnU4G74TmS+p"];
  where-is-my-sddm-theme = import ./sddm.nix {inherit pkgs;};
in {
  imports = [
    ../../modules/nixos/disk-config.nix
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

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking = {
    hostName = "hako"; # Define your hostname.
    networkmanager.enable = true;
  };

  # Turn on flag for proprietary software
  nix = {
    nixPath = ["nixos-config=/home/${user}/.local/share/src/nixos-config:/etc/nixos"];
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

    package = pkgs.nix;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  # Manages keys and such
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

      # Uncomment these for AMD or Nvidia GPU
      # boot.initrd.kernelModules = [ "amdgpu" ];
      # videoDrivers = [ "amdgpu" ];
      # videoDrivers = [ "nvidia" ];

      # Uncomment for Nvidia GPU
      # This helps fix tearing of windows for Nvidia cards
      # screenSection = ''
      #   Option       "metamodes" "nvidia-auto-select +0+0 {ForceFullCompositionPipeline=On}"
      #   Option       "AllowIndirectGLXProtocol" "off"
      #   Option       "TripleBuffer" "on"
      # '';

      # Turn Caps Lock into Ctrl
      layout = "us";
      xkb = {
        layout = "us";
      };
      xkbOptions = "ctrl:nocaps";

      # Better support for general peripherals
      libinput.enable = true;
    };

    # Let's be able to SSH into this machine
    openssh.enable = true;

    # Enable CUPS to print documents
    # printing.enable = true;
    # printing.drivers = [ pkgs.brlaser ]; # Brother printer driver

    gvfs.enable = true; # Mount, trash, and other functionalities
    tumbler.enable = true; # Thumbnail support for images

    # Audio
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };

  # Enable sound
  sound.enable = true;

  # Video support
  hardware = {
    opengl.enable = true;
    pulseaudio.enable = true;
    # hardware.nvidia.modesetting.enable = true;

    # Enable Xbox support
    # hardware.xone.enable = true;

    # Crypto wallet support
    ledger.enable = true;
  };

  # Add docker daemon
  virtualisation = {
    docker = {
      enable = true;
      logDriver = "json-file";
    };
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
          # {
          #   command = "${pkgs.systemd}/bin/reboot";
          #   options = ["NOPASSWD"];
          # }
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
