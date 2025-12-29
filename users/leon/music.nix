{ pkgs, ... }: {

    services.mpd = {
        enable = true;
        musicDirectory = "/mnt/music";
    };

    home.packages = with pkgs; [
        /* for ripping */
        abcde
        flac
        cdparanoia
        id3
        id3v2

        mpc /* mpd client */
    ];

    /* curses tui mpd client */
    programs.ncmpcpp = {
        enable = true;
        settings = {
            mouse_support = "yes";
        };
        bindings = [
            /* vim motions */
            { key = "j"; command = "scroll_down"; }
            { key = "k"; command = "scroll_up"; }
            { key = "h"; command = "previous_column"; }
            { key = "l"; command = "next_column"; }
            { key = "J"; command = [ "select_item" "scroll_down" ]; }
            { key = "K"; command = [ "select_item" "scroll_up" ]; }
        ];
    };

}
