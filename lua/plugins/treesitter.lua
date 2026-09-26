return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",

        config = function()
            require("nvim-treesitter").setup({})

            require("nvim-treesitter").install({
                "c",
                "python"
            })
        end,
    },
}
