{ config, pkgs, ... }: {

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
            l = "log --graph --pretty='%Cred%h%Creset - "
                + "%C(bold blue)%an%Creset %s%C(yellow)%d%Creset "
                + "%Cgreen(%cr)' --abbrev-commit --date=relative";
            a = "add";
        };
    };

    programs.gpg.enable = true;
    services.gpg-agent = {
        enable = true;
        enableSshSupport = true;
        sshKeys = [ "0EF933A91612E6FE2D094FFED9AA3CAFB8E935D6" ];
        pinentry.package = pkgs.pinentry-gtk2;
    };

}
