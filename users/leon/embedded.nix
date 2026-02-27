{ pkgs, ... }: {

    home.packages = with pkgs; [
        can-utils
        wireshark

        screen
        minicom
        tio

        dfu-util
        openocd
        segger-jlink
        (nrfutil.override {
            extensions = [ "nrfutil-device" "nrfutil-trace" ];
        })

        binwalk
        squashfsTools

        gcc-arm-embedded
    ];

}
