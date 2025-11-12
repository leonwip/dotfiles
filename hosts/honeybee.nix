{ config, lib, pkgs, modulesPath, ... }:
let
    preloader = pkgs.callPackage ../preloader.nix {};
in
{

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

    boot.loader.systemd-boot = {
        enable = true;
        extraFiles = {
            "EFI/BOOT/BOOTX64.EFI" = "${preloader}/share/PreLoader.efi";
            "EFI/BOOT/HashTool.efi" = "${preloader}/share/HashTool.efi";
        };
        extraEntries = {
            "HashTool.conf" = ''
                title HashTool
                efi /EFI/BOOT/HashTool.efi
                sort-key z_hashtool
            '';
        };
        extraInstallCommands = ''
            ${pkgs.uutils-coreutils-noprefix}/bin/cp /boot/EFI/systemd/systemd-bootx64.efi /boot/EFI/BOOT/loader.efi
        '';
    };
    boot.loader.efi.canTouchEfiVariables = false;

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

    systemd.services.NetworkManager-wait-online.enable = false;

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

    services.fstrim.enable = true;
    services.fwupd.enable = true;

}
