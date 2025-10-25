{ config, lib, pkgs, ... }: {

    programs.waybar = {
        enable = true;
        systemd.enable = true;

        settings = {
            mainBar = {
                layer = "top";
                position = "top";

                modules-left = [
                    "hyprland/workspaces"
                    "hyprland/window"
                ];
                modules-center = [
                    "clock"
                ];
                modules-right = [
                    "cpu"
                    "memory"
                    "disk"
                    "network"
                    "wireplumber"
                ];

                /* Left */

                "hyprland/workspaces" = {
                    persistent-workspaces = {
                        "*" = 4;
                    };
                    format = " {icon} ";
                    format-icons = {
                        default = "";
                    };
                };

                "hyprland/window" = {
                    format = "{title}";
                };

                /* Center */

                clock = {
                    interval = 1;
                    format = "  {:L%A, %B %d, %Y — %R}";
                };

                /* Right */

                cpu = {
                    interval = 1;
                    format = " {usage}%";
                };

                memory = {
                    interval = 1;
                    format = " {percentage}%";
                };

                disk = {
                    interval = 30;
                    format = " {percentage_used}%";
                };

                network = {
                    interval = 60;
                    format = " {ifname}";
                    format-ethernet = " {ipaddr}/{cidr}";
                    format-disconnected = "";
                };

                wireplumber = {
                    format = "{icon} {volume}%";
                    format-muted = "󰝟";
                    format-icons = ["" "" ""];
                };
            };

        };

        style = ''
            /* Catppuccin mocha */
            @define-color rosewater #f5e0dc;
            @define-color flamingo #f2cdcd;
            @define-color pink #f5c2e7;
            @define-color mauve #cba6f7;
            @define-color red #f38ba8;
            @define-color maroon #eba0ac;
            @define-color peach #fab387;
            @define-color yellow #f9e2af;
            @define-color green #a6e3a1;
            @define-color teal #94e2d5;
            @define-color sky #89dceb;
            @define-color sapphire #74c7ec;
            @define-color blue #89b4fa;
            @define-color lavender #b4befe;
            @define-color text #cdd6f4;
            @define-color subtext1 #bac2de;
            @define-color subtext0 #a6adc8;
            @define-color overlay2 #9399b2;
            @define-color overlay1 #7f849c;
            @define-color overlay0 #6c7086;
            @define-color surface2 #585b70;
            @define-color surface1 #45475a;
            @define-color surface0 #313244;
            @define-color base #1e1e2e;
            @define-color mantle #181825;
            @define-color crust #11111b;

            * {
                font-family: "FiraCode Nerd Font";
                font-size: 16px;
                margin: 0;
                padding: 0;
                outline: none;
                border: none;
            }

            #waybar { background: transparent; }

            .modules-left { padding-top: 5px; }
            .modules-center { padding-top: 5px; }
            .modules-right {
                padding-top: 5px;
                padding-right: 10px;
            }

            #workspaces { margin-right: 10px; }
            #workspaces button {
                padding-right: 6px;
                color: @lavender;
            }
            #workspaces button.active { color: @sky; }
            #workspaces button:hover {
                background: none;
                outline: none;
                border: none;
                box-shadow: none;
                transition: none;
                text-shadow: none;
            }
            #workspaces button:hover .workspace-label { color: @mauve; }

            #window,
            #clock { color: @text; }

            #cpu,
            #memory,
            #disk,
            #network,
            #wireplumber { margin: 0 5px 0 10px; }

            #cpu { color: @mauve; }
            #memory { color: @red; }
            #disk { color: @peach; }
            #network { color: @green; }
            #wireplumber { color: @sapphire; }
        '';
    };

}
