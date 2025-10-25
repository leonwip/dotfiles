{ config, lib, pkgs, ... }: {

    wayland.windowManager.hyprland = {
        enable = true;
        xwayland.enable = true;

        settings = {
            /* Catppuccin mocha */
            "$rosewater" = "rgb(f5e0dc)";
            "$rosewaterAlpha" = "f5e0dc";
            "$flamingo" = "rgb(f2cdcd)";
            "$flamingoAlpha" = "f2cdcd";
            "$pink" = "rgb(f5c2e7)";
            "$pinkAlpha" = "f5c2e7";
            "$mauve" = "rgb(cba6f7)";
            "$mauveAlpha" = "cba6f7";
            "$red" = "rgb(f38ba8)";
            "$redAlpha" = "f38ba8";
            "$maroon" = "rgb(eba0ac)";
            "$maroonAlpha" = "eba0ac";
            "$peach" = "rgb(fab387)";
            "$peachAlpha" = "fab387";
            "$yellow" = "rgb(f9e2af)";
            "$yellowAlpha" = "f9e2af";
            "$green" = "rgb(a6e3a1)";
            "$greenAlpha" = "a6e3a1";
            "$teal" = "rgb(94e2d5)";
            "$tealAlpha" = "94e2d5";
            "$sky" = "rgb(89dceb)";
            "$skyAlpha" = "89dceb";
            "$sapphire" = "rgb(74c7ec)";
            "$sapphireAlpha" = "74c7ec";
            "$blue" = "rgb(89b4fa)";
            "$blueAlpha" = "89b4fa";
            "$lavender" = "rgb(b4befe)";
            "$lavenderAlpha" = "b4befe";
            "$text" = "rgb(cdd6f4)";
            "$textAlpha" = "cdd6f4";
            "$subtext1" = "rgb(bac2de)";
            "$subtext1Alpha" = "bac2de";
            "$subtext0" = "rgb(a6adc8)";
            "$subtext0Alpha" = "a6adc8";
            "$overlay2" = "rgb(9399b2)";
            "$overlay2Alpha" = "9399b2";
            "$overlay1" = "rgb(7f849c)";
            "$overlay1Alpha" = "7f849c";
            "$overlay0" = "rgb(6c7086)";
            "$overlay0Alpha" = "6c7086";
            "$surface2" = "rgb(585b70)";
            "$surface2Alpha" = "585b70";
            "$surface1" = "rgb(45475a)";
            "$surface1Alpha" = "45475a";
            "$surface0" = "rgb(313244)";
            "$surface0Alpha" = "313244";
            "$base" = "rgb(1e1e2e)";
            "$baseAlpha" = "1e1e2e";
            "$mantle" = "rgb(181825)";
            "$mantleAlpha" = "181825";
            "$crust" = "rgb(11111b)";
            "$crustAlpha" = "11111b";

            /* Monitors
             * See https://wiki.hypr.land/Configuring/Monitors/ */
            monitor = ",3440x1440@100,auto,auto";

            /* https://wiki.hypr.land/Configuring/Variables/#general */
            general = {
                gaps_in = 5;
                gaps_out = 10;
                border_size = 2;
                "col.active_border" = "$lavender";
                "col.inactive_border" = "$overlay0";
                resize_on_border = false;
                allow_tearing = false;
                layout = "dwindle";
            };

            /* https://wiki.hypr.land/Configuring/Variables/#decoration */
            decoration = {
                rounding = 10;
                rounding_power = 2;
                active_opacity = 1.0;
                inactive_opacity = 1.0;

                shadow = {
                    enabled = true;
                    range = 4;
                    render_power = 3;
                    color = "$base";
                };


                /* https://wiki.hypr.land/Configuring/Variables/#blur */
                blur = {
                    enabled = true;
                    size = 3;
                    passes = 1;
                    vibrancy = 0.1696;
                };
            };

            /* https://wiki.hypr.land/Configuring/Variables/#animations */
            animations = {
                enabled = "yes";

                /* Default curves
                 * https://wiki.hypr.land/Configuring/Animations/#curves */
                bezier = [
                    "easeOutQuint,   0.23, 1,    0.32, 1"
                    "easeInOutCubic, 0.65, 0.05, 0.36, 1"
                    "linear,         0,    0,    1,    1"
                    "almostLinear,   0.5,  0.5,  0.75, 1"
                    "quick,          0.15, 0,    0.1,  1"
                ];

                /* Default animations
                 * https://wiki.hypr.land/Configuring/Animations/ */
                animation = [
                    "global,        1,     10,    default"
                    "border,        1,     5.39,  easeOutQuint"
                    "windows,       1,     4.79,  easeOutQuint"
                    "windowsIn,     1,     4.1,   easeOutQuint, popin 87%"
                    "windowsOut,    1,     1.49,  linear,       popin 87%"
                    "fadeIn,        1,     1.73,  almostLinear"
                    "fadeOut,       1,     1.46,  almostLinear"
                    "fade,          1,     3.03,  quick"
                    "layers,        1,     3.81,  easeOutQuint"
                    "layersIn,      1,     4,     easeOutQuint, fade"
                    "layersOut,     1,     1.5,   linear,       fade"
                    "fadeLayersIn,  1,     1.79,  almostLinear"
                    "fadeLayersOut, 1,     1.39,  almostLinear"
                    "workspaces,    1,     1.94,  almostLinear, fade"
                    "workspacesIn,  1,     1.21,  almostLinear, fade"
                    "workspacesOut, 1,     1.94,  almostLinear, fade"
                    "zoomFactor,    1,     7,     quick"
                ];
            };

            /* https://wiki.hypr.land/Configuring/Dwindle-Layout/ */
            dwindle = {
                pseudotile = true;
                preserve_split = true;
            };

            /* https://wiki.hypr.land/Configuring/Master-Layout/ */
            master = {
                new_status = "master";
            };

            /* Input
             * https://wiki.hypr.land/Configuring/Variables/#input */
            input = {
                kb_layout = "de";
                follow_mouse = 1;
                sensitivity = 0;
                touchpad = {
                    natural_scroll = false;
                };
            };

            /* https://wiki.hypr.land/Configuring/Gestures */
            gesture = "3, horizontal, workspace";

            /* Keybinds
             * https://wiki.hypr.land/Configuring/Binds/ */
            "$mainMod" = "SUPER";
            bind = [
                "$mainMod, C, killactive,"
                "$mainMod, M, exit,"
                "$mainMod, V, togglefloating,"
                "$mainMod, P, pseudo,"
                "$mainMod, T, togglesplit,"

                /* Programs */
                "$mainMod, Q, exec, kitty"
                "$mainMod, R, exec, $menu"
                "$mainMod CTRL, 1, exec, firefox"

                /* Move focus vim-style */
                "$mainMod, H, movefocus, l"
                "$mainMod, L, movefocus, r"
                "$mainMod, J, movefocus, d"
                "$mainMod, K, movefocus, u"

                /* Move windows vim-style */
                "$mainMod SHIFT, H, movewindow, l"
                "$mainMod SHIFT, L, movewindow, r"
                "$mainMod SHIFT, J, movewindow, d"
                "$mainMod SHIFT, K, movewindow, u"

                /* Switch workspaces */
                "$mainMod, 1, workspace, 1"
                "$mainMod, 2, workspace, 2"
                "$mainMod, 3, workspace, 3"
                "$mainMod, 4, workspace, 4"
                "$mainMod, 5, workspace, 5"
                "$mainMod, 6, workspace, 6"
                "$mainMod, 7, workspace, 7"
                "$mainMod, 8, workspace, 8"
                "$mainMod, 9, workspace, 9"
                "$mainMod, 0, workspace, 10"

                /* Move active window to a workspace */
                "$mainMod SHIFT, 1, movetoworkspace, 1"
                "$mainMod SHIFT, 2, movetoworkspace, 2"
                "$mainMod SHIFT, 3, movetoworkspace, 3"
                "$mainMod SHIFT, 4, movetoworkspace, 4"
                "$mainMod SHIFT, 5, movetoworkspace, 5"
                "$mainMod SHIFT, 6, movetoworkspace, 6"
                "$mainMod SHIFT, 7, movetoworkspace, 7"
                "$mainMod SHIFT, 8, movetoworkspace, 8"
                "$mainMod SHIFT, 9, movetoworkspace, 9"
                "$mainMod SHIFT, 0, movetoworkspace, 10"

                /* Scratchpad */
                "$mainMod, S, togglespecialworkspace, magic"
                "$mainMod SHIFT, S, movetoworkspace, special:magic"

                /* Scroll through workspaces */
                "$mainMod, mouse_down, workspace, e+1"
                "$mainMod, mouse_up, workspace, e-1"
            ];
            bindm = [
                /* Move/resize windows */
                "$mainMod, mouse:272, movewindow"
                "$mainMod, mouse:273, resizewindow"
            ];

            /* Windows
             * https://wiki.hypr.land/Configuring/Window-Rules/ */ 
            windowrule = [
                /* Ignore maximize requires from apps */
                "suppressevent maximize, class:.*"
                /* Fix some dragging issues with XWayland */
                "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
            ];
        };
    };

    services.hyprpaper = {
        enable = true;
        settings = {
            preload = [ "~/.wallpapers/wallhaven-5g22q5_3440x1440.png" ];
            wallpaper = [ ", ~/.wallpapers/wallhaven-5g22q5_3440x1440.png" ];
        };
    };

}
