{ ... }: {

    /* udev rules for CANnectivity devices
     * https://github.com/CANnectivity/cannectivity/blob/main/99-cannectivity.rules */

    users.extraGroups.plugdev = {};

    services.udev = {
        enable = true;
        extraRules = ''
            ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="1209", \
            ATTR{idProduct}=="ca01", RUN+="/sbin/modprobe -b gs_usb" \
            MODE="660", GROUP="plugdev", TAG+="uaccess"
            SUBSYSTEM=="drivers", ENV{DEVPATH}=="/bus/usb/drivers/gs_usb", \
            ATTR{new_id}="1209 ca01 ff"
        '';
    };

}
