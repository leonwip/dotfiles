{ pkgs, ... }:
let
    options = "x-systemd.automount,noauto,"
        + "x-systemd.idle-timeout=60,"
        + "x-systemd.device-timeout=5s,"
        + "x-systemd.mount-timeout=5s,"
        + "credentials=/etc/nixos/smb-secrets,"
        + "uid=1000,gid=100";
    shares = [
        { mountPoint = "/mnt/documents"; address = "//umbrella/Documents"; }
        { mountPoint = "/mnt/downloads"; address = "//umbrella/Downloads"; }
        { mountPoint = "/mnt/movies";    address = "//umbrella/Movies";    }
        { mountPoint = "/mnt/music";     address = "//umbrella/Music";     }
        { mountPoint = "/mnt/photos";    address = "//umbrella/Photos";    }
        { mountPoint = "/mnt/unsorted";  address = "//umbrella/Unsorted";  }
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
