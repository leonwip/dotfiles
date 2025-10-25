{ config, pkgs, ... }: {

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
            nix-index
            dconf
            gnumake
            ripgrep

            /* Fonts */
            dejavu_fonts
            fira-code
            fira-code-symbols
            nerd-fonts.fira-code
        ];

        file = {
            ".config/kitty".source = ./config/kitty;
            ".config/nvim".source = ./config/nvim;
            ".wallpapers".source = ./wallpapers;
        };

        pointerCursor = {
            name = "catppuccin-mocha-dark-cursors";
            package = pkgs.catppuccin-cursors.mochaDark;
            size = 16;
        };
    };

    fonts.fontconfig.enable = true;

    programs.neovim = {
        enable = true;
        defaultEditor = true;
    };

    programs.htop.enable = true;
    programs.btop.enable = true;
    programs.jq.enable = true;
    programs.bat.enable = true;

    programs.obsidian = {
        enable = true;
        vaults."obsidian".enable = true;
    };

    dconf.settings = {
        "org/gnome/desktop/interface" = {
            color-scheme = "prefer-dark";
        };
    };

    imports = [
        ./git.nix
        ./hypr.nix
        ./shell.nix
        ./waybar.nix
        ./firefox.nix
    ];

}
