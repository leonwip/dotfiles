{ pkgs, ... }:
let
    llama-cpp-cuda = pkgs.llama-cpp.override {
        cudaSupport = true;
    };
in {

    home.packages = [
        llama-cpp-cuda
    ];

    programs.opencode = {
        enable = true;
        settings = {
            theme = "catppuccin";
            provider = {
                "llama.cpp" = {
                    npm = "@ai-sdk/openai-compatible";
                    name = "llama-server (local)";
                    options = {
                        baseURL = "http://127.0.0.1:8080/v1";
                    };
                    models = {
                        "some model" = {
                            name = "some model";
                        };
                    };
                };
            };
        };
    };

}
