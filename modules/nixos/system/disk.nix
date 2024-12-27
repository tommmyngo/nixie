{
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
}
