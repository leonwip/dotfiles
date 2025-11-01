{ inputs, ... }: {

    services.locate = {
        enable = true;
        interval = "hourly";
    };

    nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
    };

    nix.optimise = {
        automatic = true;
        dates = "weekly";
    };

    system.autoUpgrade = {
        enable = true;
        flake = inputs.self.outPath;
        flags = [
            "--print-build-logs"
        ];
        dates = "weekly";
        randomizedDelaySec = "45min";
    };

}
