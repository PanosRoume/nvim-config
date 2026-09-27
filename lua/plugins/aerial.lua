return {
    {
        "stevearc/aerial.nvim",

        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },

        opts = {
            layout = {
                default_direction = "right",
                placement = "edge",
                width = 35,
                min_width = 25,
                max_width = 40,
                resize_to_content = true,
            },

            attach_mode = "window",

            close_automatic_events = {},

            filter_kind = {
                "Class",
                "Constructor",
                "Enum",
                "Function",
                "Interface",
                "Module",
                "Method",
                "Struct",
            },

            highlight_closest = true,
            highlight_on_jump = 300,

            nerd_font = "auto",

            show_guides = true,

            guides = {
                mid_item = "├─",
                last_item = "└─",
                nested_top = "│ ",
                whitespace = " ",
            },
        },
    },
}
