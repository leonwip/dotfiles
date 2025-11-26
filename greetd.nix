{ pkgs, ... }: {

    environment.systemPackages = [ pkgs.greetd ];

    services.greetd = {
        enable = true;
        /* Automatically login and start hyprland */
        settings.default_session = {
            user = "leon";
            command = "${pkgs.hyprland}/bin/hyprland";
        };
    };

}
