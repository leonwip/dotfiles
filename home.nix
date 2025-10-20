{ config, pkgs, ... }:

{
  home.username = "leon";
  home.homeDirectory = "/home/leon";
  home.stateVersion = "25.05";

    home.packages = with pkgs; [
        unzip
        curl
        tmux
        wget
        tree
        pinentry
        pavucontrol
        kicad
        gcc
        hyprpaper
        wofi
        waybar
        kitty
        inkscape
        qbittorrent
        screen
    ];

  programs.bash = {
    enable = true;
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
        g = "git";
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

  programs.git = {
    enable = true;
    userEmail = "leonwip@proton.me";
    userName = "leonwip";
    lfs.enable = true;
    signing = {
        key = "7CD40DEFE2B58305";
        signByDefault = true;
    };
    extraConfig = {
        init.defaultBranch = "main";
        push.autoSetupRemote = true;
    };
    aliases = {
        s = "status";
        c = "commit";
        d = "diff";
        l = "log --graph --pretty='%Cred%h%Creset - %C(bold blue)%an%Creset %s%C(yellow)%d%Creset %Cgreen(%cr)' --abbrev-commit --date=relative";
    };
  };

    programs.neovim = {
        enable = true;
        defaultEditor = true;
    };

  programs.htop.enable = true;
  programs.btop.enable = true;

  programs.jq.enable = true;
  programs.bat.enable = true;

  programs.firefox.enable = true;

    programs.obsidian = {
        enable = true;
        vaults."obsidian".enable = true;
    };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
    };
  };

    home.file = {
        ".config/hypr".source = ./config/hypr;
        ".config/kitty".source = ./config/kitty;
        ".config/nvim".source = ./config/nvim;
        ".config/waybar".source = ./config/waybar;
        ".icons/catppuccin-mocha-dark-cursors".source = ./icons/catppuccin-mocha-dark-cursors;
    };
}
