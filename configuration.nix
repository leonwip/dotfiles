{ pkgs, ... }: {

    services.pipewire = {
        enable = true;
        pulse.enable = true;
    };

    users.users.leon = {
        isNormalUser = true;
        extraGroups = [ "wheel" ];
        shell = pkgs.zsh;
        ignoreShellProgramCheck = true;
    };

    environment.systemPackages = with pkgs; [
        vim
        usbutils
        pciutils
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    system.stateVersion = "25.05";

}
