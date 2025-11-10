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
            pinentry
            pavucontrol
            kicad
            wofi
            kitty
            inkscape
            qbittorrent
            screen
            dconf
            eza
            fastfetch
            discord
            can-utils

            /* minecraft */
            prismlauncher
            temurin-bin-21

            /* Fonts */
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

    programs.obsidian = {
        enable = true;
        vaults."obsidian".enable = true;
    };

    gtk = {
        enable = true;
        colorScheme = "dark";
    };

    programs.nix-index = {
        enable = true;
        enableZshIntegration = true;
    };

    imports = [
        ./git.nix
        ./hypr.nix
        ./neovim.nix
        ./shell.nix
        ./waybar.nix
        ./firefox.nix
    ];

}
