{ ... }: {

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
        enableZshIntegration = true;
        settings = {
            add_newline = true;
            character = {
                success_symbol = "[➜](bold green)";
                error_symbol = "[➜](bold red)";
            };
        };
    };

}
