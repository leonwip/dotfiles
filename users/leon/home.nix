{ pkgs, ... }: {

    home = {
        stateVersion = "25.05";

        username = "leon";
        homeDirectory = "/home/leon";

        packages = with pkgs; [
            unzip
            curl
            tmux
            wget
            tree
            pavucontrol
            kicad
            wofi
            kitty
            inkscape
            gimp
            qbittorrent
            dconf
            eza
            fastfetch
            discord
            file
            xorriso
            qemu
            OVMF
            grim

            /* minecraft */
            prismlauncher
            temurin-bin-21

            /* fonts */
            dejavu_fonts
            fira-code
            fira-code-symbols
            nerd-fonts.fira-code
        ];

        file = {
            ".config/kitty".source = ./config/kitty;
            ".wallpapers".source = ./wallpapers;
        };

        pointerCursor = {
            name = "catppuccin-mocha-dark-cursors";
            package = pkgs.catppuccin-cursors.mochaDark;
            size = 16;
        };
    };

    fonts.fontconfig.enable = true;

    programs.htop.enable = true;
    programs.btop.enable = true;
    programs.jq.enable = true;

    gtk = {
        enable = true;
        colorScheme = "dark";
    };

    imports = [
        ./embedded.nix
        ./firefox.nix
        ./git.nix
        ./hypr.nix
        ./music.nix
        ./neovim.nix
        ./shell.nix
        ./vibecode.nix
        ./waybar.nix
    ];

}
