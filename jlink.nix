{ ... }: {

    nixpkgs.config = {
        allowUnfree = true;
        segger-jlink.acceptLicense = true;
        permittedInsecurePackages = [
            "segger-jlink-qt4-874"
        ];
    };

}
