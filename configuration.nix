{ pkgs, ... }: {

    services.pipewire = {
        enable = true;
        pulse.enable = true;
    };

    programs.wireshark.enable = true;

    services.timesyncd.enable = true;

    users.users.leon = {
        isNormalUser = true;
        extraGroups = [
            "wheel"
            "wireshark"
            "dialout"
        ];
        shell = pkgs.zsh;
        ignoreShellProgramCheck = true;
    };

    environment.systemPackages = with pkgs; [
        vim
        usbutils
        pciutils
    ];

    environment.pathsToLink = [
        "/share/applications"
        "/share/xdg-desktop-portal"
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    system.stateVersion = "25.05";

}
