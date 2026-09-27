return {
    {
        "nvim-tree/nvim-tree.lua",

        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },

        config = function()
            require("nvim-tree").setup({
                sync_root_with_cwd = true,
                respect_buf_cwd = true,

                update_focused_file = {
                    enable = true,
                    update_root = true,
                },

                renderer = {
                    highlight_git = true,
                    highlight_opened_files = "name",
                },

                diagnostics = {
                    enable = true,
                    show_on_dirs = true,
                },
            })
        end,
    },
}
