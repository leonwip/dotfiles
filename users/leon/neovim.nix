{ pkgs, ... }: {

    programs.neovim = {
        enable = true;
        defaultEditor = true;
    };

    home.packages = with pkgs; [
        ripgrep /* for telescope */
        gnumake /* for building avante */

        /* lsp servers */
        clang-tools
        lua-language-server
        rust-analyzer
        marksman
        nixd
    ];

    home.file.".config/nvim".source = ./config/nvim;

    /* claude api key for avante */
    home.sessionVariables.AVANTE_ANTHROPIC_API_KEY = "redacted";

}
