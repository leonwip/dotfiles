{ pkgs ? import <nixpkgs> {} }:
let
    url = "https://blog.hansenpartnership.com/wp-uploads/2013";
in
    pkgs.stdenv.mkDerivation {
        pname = "preloader-signed";
        version = "20130208-1";

        srcs = [
            (pkgs.fetchurl {
                url = "${url}/PreLoader.efi";
                sha256 = "sha256-UJBhFMWj+TwQECgp0Fcgbjwyvt/0rtP4mldt4cnp5ao=";
            })
            (pkgs.fetchurl {
                url = "${url}/HashTool.efi";
                sha256 = "sha256-kZ81Ye6lyyBoHZCYaxzte2J66tCUlhlDJfaBx8zBRGg=";
            })
        ];

        unpackPhase = ''
            runHook preUnpack

            for _src in $srcs; do
                cp "$_src" $(stripHash "$_src")
            done

            runHook postUnpack
        '';

        installPhase = ''
            runHook preInstall

            mkdir -p $out/share
            mv PreLoader.efi $out/share/
            mv HashTool.efi $out/share/

            runHook postInstall
        '';
    }
