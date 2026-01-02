{ pkgs, ... }: {

    boot.plymouth = {
        enable = true;
        theme = "bgrt";
        logo = ./psxboot.png;
    };

    /* Hide boot messages for clean splash screen */
    boot.kernelParams = [
        "quiet"
        "splash"
    ];

    /* Reduce console log verbosity (only show errors) */
    boot.consoleLogLevel = 3;

    /* Hide verbose initrd messages */
    boot.initrd.verbose = false;

    /* Hide bootloader menu (auto-select default) */
    boot.loader.timeout = 0;

}
