return {
    "Bekaboo/dropbar.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        build = "make",
    },
    config = function()
        local wk = require("which-key")
        local dropbar_api = require("dropbar.api")
        wk.add({
            {
                "<Leader>b", dropbar_api.pick, mode = "n",
                icon = "", desc = "Pick in dropbar",
            },
            {
                "[b", dropbar_api.goto_context_start, mode = "n",
                icon = "", desc = "Go to start of current context",
            },
            {
                "]b", dropbar_api.select_next_context, mode = "n",
                icon = "", desc = "Select next context",
            },
        })
    end
}
