{ pkgs, ... }:
let
    options = "x-systemd.automount,noauto,"
        + "x-systemd.idle-timeout=60,"
        + "x-systemd.device-timeout=5s,"
        + "x-systemd.mount-timeout=5s,"
        + "credentials=/etc/nixos/smb-secrets,"
        + "uid=1000,gid=100";
    shares = [
        { mountPoint = "/mnt/documents"; address = "//napoles/Documents"; }
        { mountPoint = "/mnt/downloads"; address = "//napoles/Downloads"; }
        { mountPoint = "/mnt/movies";    address = "//napoles/Movies";    }
        { mountPoint = "/mnt/music";     address = "//napoles/Music";     }
        { mountPoint = "/mnt/photos";    address = "//napoles/Photos";    }
        { mountPoint = "/mnt/unsorted";  address = "//napoles/Unsorted";  }
    ];
    mkMount = share: {
        name = share.mountPoint;
        value = {
            device = share.address;
            fsType = "cifs";
            options = [ options ];
        };
    };
in {
    environment.systemPackages = [ pkgs.cifs-utils ];
    fileSystems = builtins.listToAttrs (map mkMount shares);
}
