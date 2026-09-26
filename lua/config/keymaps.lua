vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", {
    desc = "Find files",
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
    vim.lsp.buf.format()
end, {
    desc = "Format buffer",
})

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", {
    desc = "Toggle file explorer",
})
