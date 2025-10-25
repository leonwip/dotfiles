{ config, lib, pkgs, modulesPath, ... }: {

    imports = [
        (modulesPath + "/installer/scan/not-detected.nix")
    ];

    /* Kernel */

    boot.initrd.availableKernelModules = [
        "xhci_pci"
        "nvme"
        "ahci"
        "thunderbolt"
        "usbhid"
        "usb_storage"
        "sd_mod"
    ];
    boot.initrd.kernelModules = [];
    boot.kernelModules = [ "kvm-amd" ];
    boot.extraModulePackages = [];

    /* Bootloader */

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    /* Drives */

    fileSystems = {
        "/" = {
            device = "/dev/disk/by-label/nixos";
            fsType = "ext4";
        };
        "/boot" = {
            device = "/dev/disk/by-label/boot";
            fsType = "vfat";
            options = [ "fmask=0022" "dmask=0022" ];
        };
    };

    swapDevices = [
        { device = "/dev/disk/by-label/swap"; }
    ];

    /* Networking */

    networking.useDHCP = lib.mkDefault true;
    networking.hostName = "honeybee";
    networking.networkmanager.enable = true;

    /* Graphics stuff */

    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.graphics.enable = true;
    hardware.nvidia = {
        modesetting.enable = true;
        powerManagement.enable = false;
        powerManagement.finegrained = false;
        open = true;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    nixpkgs.config.allowUnfree = true;

    /* Misc */

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

}
