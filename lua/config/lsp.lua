vim.lsp.config("clangd", {
    cmd = { "clangd" },
    filetypes = { "c", "cpp" },
    root_markers = {
        "compile_commands.json",
        "compile_flags.txt",
        ".git",
    },
})

vim.lsp.enable("clangd")

vim.lsp.config("pyright", {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = {
        "pyproject.toml",
        "setup.py",
        "setup.cfg",
        "requirements.txt",
        ".git",
    },
})

vim.lsp.enable("pyright")
