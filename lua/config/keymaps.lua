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

vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>", {
    desc = "Toggle terminal",
})

local function run_current_file()
    local file = vim.fn.expand("%:p")
    local filetype = vim.bo.filetype

    if filetype == "c" then
        local output = vim.fn.expand("%:p:r")

        local command = string.format(
            "gcc %s -o %s && %s",
            vim.fn.shellescape(file),
            vim.fn.shellescape(output),
            vim.fn.shellescape(output)
        )

        require("toggleterm.terminal").Terminal:new({
            cmd = command,
            direction = "float",
            close_on_exit = false,
        }):toggle()

    elseif filetype == "cpp" then
        local output = vim.fn.expand("%:p:r")

        local command = string.format(
            "g++ %s -o %s && %s",
            vim.fn.shellescape(file),
            vim.fn.shellescape(output),
            vim.fn.shellescape(output)
        )

        require("toggleterm.terminal").Terminal:new({
            cmd = command,
            direction = "float",
            close_on_exit = false,
        }):toggle()

    elseif filetype == "python" then
        local command = string.format(
            "python3 %s",
            vim.fn.shellescape(file)
        )

        require("toggleterm.terminal").Terminal:new({
            cmd = command,
            direction = "float",
            close_on_exit = false,
        }):toggle()

    else
        print("No run command configured for filetype: " .. filetype)
    end
end

vim.keymap.set("n", "<leader>r", run_current_file, {
    desc = "Run current file",
})
