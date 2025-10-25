{ config, lib, pkgs, ... }: {

    services.pipewire = {
        enable = true;
        pulse.enable = true;
    };

    users.users.leon = {
        isNormalUser = true;
        extraGroups = [ "wheel" ];
    };

    environment.systemPackages = with pkgs; [
        vim
        usbutils
        pciutils
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    system.stateVersion = "25.05";

}
