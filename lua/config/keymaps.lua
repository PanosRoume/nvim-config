vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", {
    desc = "Find files",
})

vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", {
    desc = "Live grep",
})

vim.keymap.set("n", "K", vim.lsp.buf.hover, {
    desc = "LSP Hover",
})

vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
    desc = "Go to Definition",
})

vim.keymap.set("n", "gr", vim.lsp.buf.references, {
    desc = "Find References",
})

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {
    desc = "Rename Symbol",
})

vim.keymap.set("n", "<leader>f", function()
    require("conform").format({
        lsp_fallback = true,
    })
end, {
    desc = "Format buffer",
})

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", {
    desc = "Toggle file explorer",
})

vim.keymap.set("n", "<leader>dc", function()
    require("dap").continue()
end, {
    desc = "Debug: Continue",
})

vim.keymap.set("n", "<leader>db", function()
    require("dap").toggle_breakpoint()
end, {
    desc = "Debug: Toggle Breakpoint",
})

vim.keymap.set("n", "<leader>dn", function()
    require("dap").step_over()
end, {
    desc = "Debug: Step Over",
})

vim.keymap.set("n", "<leader>di", function()
    require("dap").step_into()
end, {
    desc = "Debug: Step Into",
})

vim.keymap.set("n", "<leader>do", function()
    require("dap").step_out()
end, {
    desc = "Debug: Step Out",
})

vim.keymap.set("n", "<leader>gp", function()
    require("gitsigns").preview_hunk()
end, {
    desc = "Git: Preview Hunk",
})

vim.keymap.set("n", "<leader>gn", function()
    require("gitsigns").next_hunk()
end, {
    desc = "Git: Next Hunk",
})

vim.keymap.set("n", "<leader>gN", function()
    require("gitsigns").prev_hunk()
end, {
    desc = "Git: Previous Hunk",
})

vim.keymap.set("n", "<leader>gb", function()
    require("gitsigns").blame_line()
end, {
    desc = "Git: Blame Line",
})

vim.keymap.set("n", "<leader>gs", function()
    require("gitsigns").stage_hunk()
end, {
    desc = "Git: Stage Hunk",
})

vim.keymap.set("n", "<leader>gu", function()
    require("gitsigns").reset_hunk()
end, {
    desc = "Git: Reset Hunk",
})

vim.keymap.set("n", "<leader>d", function()
    vim.diagnostic.open_float()
end, {
    desc = "Show diagnostic",
})
