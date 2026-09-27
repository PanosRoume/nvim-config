vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.cursorline = true

vim.opt.termguicolors = true

vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8

function _G.project_path()
    local file = vim.fn.expand("%:p")

    if file == "" then
        return ""
    end

    local root = vim.fs.root(0, {
        ".git",
        "compile_commands.json",
        "compile_flags.txt",
        "pyproject.toml",
        "setup.py",
        "setup.cfg",
        "requirements.txt",
    })

    if root then
        local relative = vim.fs.relpath(root, file)
        local project = vim.fs.basename(root)

        return "%#WinBarProject#󰉋 " .. project
            .. "%#WinBarSeparator#  ›  "
            .. "%#WinBarPath#" .. relative
            .. "%*"
    end

    return "%#WinBarPath#󰈔 " .. vim.fn.fnamemodify(file, ":~") .. "%*"
end

vim.opt.winbar = "%{%v:lua.project_path()%}"

vim.api.nvim_set_hl(0, "WinBarProject", {
    bold = true,
})

vim.api.nvim_set_hl(0, "WinBarSeparator", {
    link = "Comment",
})

vim.api.nvim_set_hl(0, "WinBarPath", {
    link = "Normal",
})
