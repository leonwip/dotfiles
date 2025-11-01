{ pkgs, ... }: {

    programs.firefox = {
        enable = true;

        profiles.nixos = {
            id = 0;
            name = "nixos";
            isDefault = true;

            settings = {
                # Privacy & security

                # Tracking protection
                "privacy.trackingprotection.enabled" = true;
                "privacy.trackingprotection.pbmode" = true;
                # Don't allow stuff for convenience
                "privacy.trackingprotection.allow_list.convenience.enabled" = false;
                # Block social media trackers
                "privacy.trackingprotection.socialtracking.enabled" = true;
                # Fingerprinting mitigation
                "privacy.fingerprintingProtection" = true;
                # Prevent cross-site tracking
                "privacy.firstparty.isolate" = true;
                # Isolate network connections by site
                "privacy.partition.network_state" = true;
                # Isolate cookies by site
                "network.cookie.cookieBehavior" = 5;
                # Referrers only for same origin
                "network.http.referer.XOriginPolicy" = 2;
                # Disable geolocation requests
                "geo.enabled" = false;
                # Block access to sensors
                "device.sensors.enabled" = false;
                # Disable WebRTC
                "media.peerconnection.enabled" = false;
                # Remove known tracking parameters
                "privacy.query_stripping.enabled" = true;
                # Remove known tracking parameters in private browsing
                "privacy.query_stripping.enabled.pbmode" = true;
                # Tell sites to not share data
                "privacy.globalprivacycontrol.enabled" = true;
                # Don't remember logins, addresses, etc.
                "signon.rememberSignons" = false;
                "extensions.formautofill.addresses.enabled" = false;
                "extensions.formautofill.creditCards.enabled" = false;

                # Telemetry

                # Disable telemetry
                "toolkit.telemetry.enabled" = false;
                # Disable unified telemetry
                "toolkit.telemetry.unified" = false;
                # Disable usage pings
                "datareporting.usage.uploadEnabled" = false;
                # Disable health report
                "datareporting.healthreport.uploadEnabled" = false;
                # Disable new tab page telemetry
                "browser.newtabpage.activity-stream.feeds.telemetry" = false;
                "browser.newtabpage.activity-stream.telemetry" = false;
                # Don't participate in studies
                "app.shield.optoutstudies.enabled" = false;

                # UI/UX improvements

                # Disable pocket
                "extensions.pocket.enabled" = false;
                # Hide side bar
                "sidebar.visibility" = "hide-sidebar";
                # Don't close window when closing last tab
                "browser.tabs.closeWindowWithLastTab" = false;
                # Don't warn on close
                "browser.tabs.warnOnClose" = false;
                # Restore previous session
                "browser.startup.page" = 3;
                # Don't show sponsored/suggested content
                "browser.newtabpage.activity-stream.showSponsored" = false;
                "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false;
                "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
                "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
                "browser.urlbar.suggest.quicksuggest.sponsored" = false;
                "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
                "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
                # Don't show trending searches
                "browser.urlbar.suggest.trending" = false;
                # Don't show first run welcome
                "browser.aboutwelcome.enabled" = false;
            };

            bookmarks = {
                force = true;
                settings = [
                    { name = "Wikipedia"; url = "https://www.wikipedia.org/"; }
                    { name = "Hacker News"; url = "https://news.ycombinator.com/"; }
                    { name = "tagesschau"; url = "https://www.tagesschau.de/"; }
                    { name = "GitHub"; url = "https://github.com/"; }
                    { name = "Reddit"; url = "https://www.reddit.com/"; }
                    { name = "YouTube"; url = "https://www.youtube.com/"; }
                    { name = "MyNixOS"; url = "https://mynixos.com/"; }
                    { name = "NixOS Search"; url = "https://search.nixos.org/packages"; }
                    { name = "ChatGPT"; url = "https://chatgpt.com/"; }
                    { name = "Hackaday"; url = "https://hackaday.com/blog/"; }
                    { name = "Buildroot Manual"; url = "https://buildroot.org/downloads/manual/manual.html"; }
                    { name = "Claude Console"; url = "https://console.anthropic.com/"; }
                    { name = "New York Times"; url = "https://www.nytimes.com/"; }
                    { name = "Twitch"; url = "https://www.twitch.tv/"; }
                    { name = "Mouser"; url = "https://eu.mouser.com/"; }
                    { name = "DigiKey"; url = "https://digikey.de/"; }
                    { name = "KiCanvas"; url = "https://kicanvas.org/"; }
                    { name = "ZDF"; url = "https://zdf.de/"; }
                    { name = "ARD Mediathek"; url = "https://ardmediathek.de/"; }
                    { name = "Apple Music"; url = "https://beta.music.apple.com/"; }
                    { name = "Apple Podcasts"; url = "https://podcasts.apple.com/de/new"; }
                    { name = "IMDb"; url = "https://www.imdb.com/"; }
                    { name = "ArchWiki"; url = "https://wiki.archlinux.org/title/Main_page"; }
                    { name = "Adafruit"; url = "https://www.adafruit.com/"; }
                    { name = "SparkFun"; url = "https://www.sparkfun.com/"; }
                    { name = "Zephyr Documentation"; url = "https://docs.zephyrproject.org/latest/index.html"; }
                    { name = "Golem"; url = "https://www.golem.de/"; }
                    { name = "heise"; url = "https://www.heise.de/"; }
                    { name = "AISLER"; url = "https://aisler.net/"; }
                    { name = "Proton Mail"; url = "https://account.proton.me/mail"; }
                ];
            };

            search = {
                force = true;

                engines = {
                    nix-packages = {
                        name = "Nix Packages";
                        urls = [{
                            template = "https://search.nixos.org/packages";
                            params = [
                                { name = "type"; value = "packages"; }
                                { name = "query"; value = "{searchTerms}"; }
                            ];
                        }];
                        icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                        definedAliases = [ "@np" ];
                    };

                    nixos-wiki = {
                        name = "NixOS Wiki";
                        urls = [{
                            template = "https://wiki.nixos.org/w/index.php";
                            params = [
                                { name = "search"; value = "{searchTerms}"; }
                            ];
                        }];
                        iconMapObj."16" = "https://wiki.nixos.org/favicon.ico";
                        definedAliases = [ "@nw" ];
                    };

                    my-nixos = {
                        name = "MyNixOS";
                        urls = [{
                            template = "https://mynixos.com/search";
                            params = [
                                { name = "q"; value = "{searchTerms}"; }
                            ];
                        }];
                        iconMapObj."16" = "https://mynixos.com/favicon.ico";
                        definedAliases = [ "@mn" ];
                    };

                    github = {
                        name = "GitHub";
                        urls = [{
                            template = "https://github.com/search";
                            params = [
                                { name = "q"; value = "{searchTerms}"; }
                            ];
                        }];
                        iconMapObj."16" = "https://github.com/favicon.ico";
                        definedAliases = [ "@gh" ];
                    };

                    arch-wiki = {
                        name = "ArchWiki";
                        urls = [{
                            template = "https://wiki.archlinux.org/index.php";
                            params = [
                                { name = "search"; value = "{searchTerms}"; }
                            ];
                        }];
                        iconMapObj."16" = "https://wiki.archlinux.org/favicon.ico";
                        definedAliases = [ "@aw" ];
                    };

                    zephyr-doc = {
                        name = "Zephyr Documentation";
                        urls = [{
                            template = "https://docs.zephyrproject.org/latest/gsearch.html";
                            params = [
                                { name = "q"; value = "{searchTerms}"; }
                            ];
                        }];
                        iconMapObj."16" = "https://docs.zephyrproject.org/latest/_static/favicon.png";
                        definedAliases = [ "@z" ];
                    };
                };
            };
        };
    };

}
