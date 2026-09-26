# Neovim Development Environment

My personal Neovim configuration, built from scratch as a learning project and development environment.

The goal is **not** to use a giant pre-made configuration, but to understand what each component does and build the environment piece by piece.

Currently focused on **C/C++ and Python**, with support for Git, debugging, LSP, completion, formatting, project search, and file management.


---------------------------------------------------------------------------------------------ripgrep	Telescope live grep (<Space>fg)
clang	C compiler + clang-format
clang-tools-extra	clangd LSP
gcc	C compilation
gdb	C debugging through DAP
python	Python itself
python-pyright	Python LSP/type checking
ruff	Python formatting------------

## 🛠️ Current Stack

| Component        | Purpose                       |
| ---------------- | ----------------------------- |
| **Neovim**       | Editor                        |
| **lazy.nvim**    | Plugin manager                |
| **Catppuccin**   | Colorscheme                   |
| **Telescope**    | File and text search          |
| **NvimTree**     | File explorer                 |
| **Treesitter**   | Syntax parsing                |
| **clangd**       | C/C++ LSP                     |
| **Pyright**      | Python LSP                    |
| **blink.cmp**    | Completion                    |
| **Conform.nvim** | Formatting                    |
| **clang-format** | C/C++ formatter               |
| **Ruff**         | Python formatter              |
| **nvim-dap**     | Debug Adapter Protocol        |
| **nvim-dap-ui**  | Debugger interface            |
| **GDB**          | C/C++ debugger                |
| **Gitsigns**     | Git integration inside Neovim |
| **Git + GitHub** | Version control               |

---------------------------------------------------------------------------------------------------------

# ⌨️ Key Guide

The leader key is:


Space


So `<leader>ff` means:


Space → f → f


---------------------------------------------------------------------------------------------------------

## 🔎 Finding & Navigation

| Key          | Action                         |
| ------------ | ------------------------------ |
| `<leader>ff` | Find files                     |
| `<leader>fg` | Search text across the project |
| `<leader>e`  | Toggle file explorer           |

### Find Files

<leader>ff


Opens Telescope's file finder.

Useful when you know roughly what file you're looking for but don't want to navigate directories manually.

### Live Grep


<leader>fg


Searches inside project files.

For example, searching for:


malloc


can find every occurrence across a project.

Telescope uses `ripgrep` for this.

### File Explorer


<leader>e


Opens/closes NvimTree.

---------------------------------------------------------------------------------------------------------

# 🧠 LSP / Code Intelligence

These commands work across supported languages.

| Key          | Action                                 |
| ------------ | -------------------------------------- |
| `K`          | Show documentation / hover information |
| `gd`         | Go to definition                       |
| `gr`         | Find references                        |
| `<leader>rn` | Rename symbol                          |
| `<leader>d`  | Show diagnostic                        |
| `<leader>f`  | Format file                            |

---------------------------------------------------------------------------------------------------------

### `K` — Hover

Place the cursor over a function, variable, type, etc. and press:


K


The language server provides information about the symbol.

---

### `gd` — Go to Definition

Place the cursor over a function or symbol:


gd


Neovim jumps to its definition.

---

### `gr` — Find References

Finds places where the current symbol is used.

Useful for answering:

> Where is this function/variable being used?

---

### `<leader>rn` — Rename

Renames a symbol and its references using the language server.

---

### `<leader>d` — Diagnostic

Shows the diagnostic underneath the cursor.

For example, Pyright may report a type error, while clangd may report a C/C++ compiler diagnostic.

The red `E` signs in the gutter indicate error diagnostics.

---

### `<leader>f` — Format

Formats the current file.

The formatter is selected based on the file type:


C       → clang-format
C++     → clang-format
Python  → Ruff


Conform.nvim manages the formatting layer.

---------------------------------------------------------------------------------------------------------

# 🐛 Debugging

Debugging is provided by:


nvim-dap
nvim-dap-ui
GDB


Current debugger mappings:

| Key          | Action                     |
| ------------ | -------------------------- |
| `<leader>dc` | Continue / start debugging |
| `<leader>db` | Toggle breakpoint          |
| `<leader>dn` | Step over                  |
| `<leader>di` | Step into                  |
| `<leader>do` | Step out                   |

---

### `<leader>dc`

Starts or continues the debugger.

For C programs, DAP asks for the executable path.


~/Code/C/debug-test/main


---

### `<leader>db`

Toggles a breakpoint on the current line.

---

### `<leader>dn`

Steps over the current line.

Equivalent to using `next` in GDB.

---

### `<leader>di`

Steps into the function currently being called.

Example:

```c
int sum = add(x, y);
```

Stepping into this line enters:

```c
int add(int a, int b)
```

---

### `<leader>do`

Steps out of the current function and returns to its caller.

---------------------------------------------------------------------------------------------------------

# 🐙 Git / Gitsigns

Gitsigns shows Git changes directly in the editor gutter.

| Key          | Action             |
| ------------ | ------------------ |
| `<leader>gp` | Preview hunk       |
| `<leader>gn` | Next hunk          |
| `<leader>gN` | Previous hunk      |
| `<leader>gb` | Blame current line |
| `<leader>gs` | Stage hunk         |
| `<leader>gu` | Reset hunk         |

A **hunk** is a section of changes in a file.

---

### `<leader>gp`

Preview the current Git hunk.

Useful for quickly seeing what changed.

### `<leader>gn`

Jump to the next changed hunk.

### `<leader>gN`

Jump to the previous changed hunk.

### `<leader>gb`

Show Git blame information for the current line.

### `<leader>gs`

Stage the current hunk.

This allows individual changes to be staged instead of staging the entire file.

### `<leader>gu`

Reset the current hunk back to the version in Git.

> ⚠️ This is different from normal Neovim undo. It discards the current Git hunk.

---------------------------------------------------------------------------------------------------------

# 🧩 Language Support

## C / C++


.c / .cpp
      ↓
Treesitter
      ↓
clangd
      ↓
blink.cmp
      ↓
clang-format
      ↓
GDB + DAP


Provides:

* Syntax parsing
* Completion
* Hover documentation
* Go to definition
* References
* Rename
* Diagnostics
* Formatting
* Debugging

---

## Python


.py
 ↓
Treesitter
 ↓
Pyright
 ↓
blink.cmp
 ↓
Ruff
 ↓
DAP


Currently provides:

* Syntax parsing
* Completion
* Hover documentation
* Go to definition
* References
* Rename
* Type checking
* Diagnostics
* Formatting

Python debugging through DAP can be added later.

---------------------------------------------------------------------------------------------------------

# 🧱 Configuration Structure

The configuration is intentionally split into small pieces instead of keeping everything inside one huge `init.lua`.

`
~/.config/nvim/
├── init.lua
├── lazy-lock.json
└── lua/
    ├── config/
    │   ├── options.lua
    │   ├── lazy.lua
    │   ├── keymaps.lua
    │   ├── lsp.lua
    │   └── dap.lua
    │
    └── plugins/
        ├── colorscheme.lua
        ├── telescope.lua
        ├── treesitter.lua
        ├── completion.lua
        ├── filetree.lua
        ├── conform.lua
        ├── dap.lua
        ├── dap-ui.lua
        └── gitsigns.lua


The idea is to keep each part understandable and easy to modify.

---------------------------------------------------------------------------------------------------------

# 🔧 External Tools

The development environment currently relies on several system tools.

### C / C++


gcc
clangd
clang-format
gdb


### Python


python3
pyright
ruff
`

### Search


ripgrep


---------------------------------------------------------------------------------------------------------

# 🎯 Philosophy

This configuration is being built incrementally.

Instead of installing an enormous preconfigured Neovim distribution, every major component is added manually and tested individually.

The goal is to understand:

* what Neovim itself does
* what plugins do
* what an LSP actually provides
* how completion works
* how formatters work
* how debugging works
* how Git integrates with an editor
* how different languages can share the same editor workflow

The end result is a personal development environment that can grow with the languages and tools I learn.

---------------------------------------------------------------------------------------------------------

# 🚧 Future Plans

Potential additions:

* Python debugging with DAP
* Rust / `rust-analyzer`
* Java / `jdtls`
* Better Git workflows
* More Telescope functionality
* Additional diagnostic navigation
* Project/build integration
* Terminal integration
* More advanced DAP configuration

The configuration will continue to be built **one piece at a time** rather than turning into a giant collection of unexplained plugins.

---------------------------------------------------------------------------------------------------------
## 📌 Quick Reference


SEARCH


| Key          | Action             |
----------------------------------
| Space ff   |    Find files     |
| Space fg   |    Live grep      |
| Space e    |    File tree      |
----------------------------------

LSP


| Key          | Action             |
--------------------------------------
| K          |  Hover / documentation |
| gd         |    Go to definition    |
| gr         |    Find references     |
| Space rn   |       Rename           |
| Space d    |    Show diagnostic     |
| Space f    |        Format          |
---------------------------------------

DEBUG


| Key          | Action             |
-----------------------------------------------
| Space dc      |       Continue / start      |
| Space db      |       Toggle breakpoint     |
| Space dn      |           Step over         |
| Space di      |           Step into         |
| Space do      |            Step out         |
-----------------------------------------------

GIT


| Key          | Action             |
-------------------------------------------
| Space gp      |        Preview hunk     |
| Space gn      |         Next hunk       |
| Space gN      |        Previous hunk    |
| Space gb      |         Blame line      |
| Space gs      |         Stage hunk      |
| Space gu      |         Reset hunk      |
-------------------------------------------

---------------------------------------------------------------------------------------------------------

Packages needed :

rg
ripgrep
clang
clang-tools-extra
gcc
gdb
python
pyright
ruff

---------------------------------------------------------------------------------------------------------

**Built incrementally with Neovim, one plugin and one concept at a time.** 💤🔥

---------------------------------------------------------------------------------------------------------
