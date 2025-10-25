return {
    "yetone/avante.nvim",
    build = "make",
    event = "VeryLazy",
    version = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
    },
    opts = {
        instructions_file = "avante.md",
        provider = "claude",
        providers = {
            endpoint = "https://api.anthropic.com",
            model = "claude-sonnet-4-20250514",
            timeout = 30000,
            extra_request_body = {
                temperature = 0.75,
                max_tokens = 20480,
            },
        },
    },
}
