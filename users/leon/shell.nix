{ pkgs, ... }: {

    programs.bash.enable = true;

    programs.zsh = {
        enable = true;

        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
            /* Git aliases */
            g = "git";
            gs = "git s";
            gd = "git d";
            gl = "git l";
            ga = "git a";
        };

        /* prompt marker for neovim terminal */
        initContent = ''
            PROMPT_COMMAND='printf "\033]133;A\007"'
            precmd() { eval "$PROMPT_COMMAND" }
        '';

        history.size = 10000;

        oh-my-zsh = {
            enable = true;
            plugins = [
                "git"
                "eza"
                "z"
                "systemd"
                "sudo"
                "history"
            ];
        };
    };

    programs.starship = {
        enable = true;
        enableBashIntegration = false;
        enableZshIntegration = true;
        settings = {
            add_newline = true;
            character = {
                success_symbol = "[➜](bold green)";
                error_symbol = "[➜](bold red)";
            };
        };
    };

    programs.direnv = {
        enable = true;
        enableBashIntegration = false;
        enableZshIntegration = true;
        nix-direnv.enable = true;
    };

    programs.bat = {
        enable = true;
        config = {
            theme = "catppuccin-mocha";
        };
        themes = {
            catppuccin-mocha = {
                src = pkgs.fetchFromGitHub {
                    owner = "catppuccin";
                    repo = "bat";
                    rev = "6810349b28055dce54076712fc05fc68da4b8ec0";
                    sha256 = "lJapSgRVENTrbmpVyn+UQabC9fpV1G1e+CdlJ090uvg=";
                };
                file = "themes/Catppuccin Mocha.tmTheme";
            };
        };
    };

}
