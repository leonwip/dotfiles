{ config, pkgs, ... }:

{
  home.username = "leon";
  home.homeDirectory = "/home/leon";
  home.stateVersion = "25.05";
  programs.bash = {
    enable = true;
    shellAliases = {
    };
    profileExtra = ''
      if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        exec hyprland
      fi
    '';
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
    };
    history.size = 10000;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" ];
    };
  };
  programs.gpg = {
    enable = true;
  };
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    sshKeys = [ "0EF933A91612E6FE2D094FFED9AA3CAFB8E935D6" ];
    pinentry.package = pkgs.pinentry-gtk2;
  };
  home.file.".config/hypr".source = ./config/hypr;
  home.file.".config/kitty".source = ./config/kitty;
  home.file.".config/nvim".source = ./config/nvim;
}
