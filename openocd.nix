{ pkgs, ... }: {

    /* to be able to run openocd without root privileges */

    users.extraGroups.plugdev = {};

    users.users.leon.extraGroups = [
        "plugdev"
        "dialout"
    ];

    services.udev.packages = [
        pkgs.openocd
    ];

}
