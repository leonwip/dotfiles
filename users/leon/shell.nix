{ config, pkgs, ... }: {

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

        initContent = ''
            PROMPT_COMMAND='printf "\033]133;A\007"'
            precmd() { eval "$PROMPT_COMMAND" }
        '';

        history.size = 10000;

        oh-my-zsh = {
            enable = true;
            theme = "robbyrussell";
            plugins = [ "git" ];
        };
    };

}
