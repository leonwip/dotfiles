{ pkgs, ... }: {

    programs.neovim = {
        enable = true;
        defaultEditor = true;
    };

    home.packages = with pkgs; [
        ripgrep /* for telescope */

        /* lsp servers */
        clang-tools
        lua-language-server
        rust-analyzer
        marksman
        nixd
    ];

    home.file.".config/nvim".source = ./config/nvim;

}
