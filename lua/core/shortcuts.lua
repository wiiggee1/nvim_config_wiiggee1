
-- Editor shortcuts, useful for programming and software development
-- vim.api.nvim_set_keymap('n','lhs', 'rhs', option)
local keybind = vim.keymap.set
local default_options = { noremap = true, silent = true }


-- CR = "Enter key"

-- Set leader key
vim.g.mapleader=" "
keybind("n", "<leader>pv", vim.cmd.Ex)

-- Shortcut keybinding for saving file using: "CTRL S"
keybind("i", "<C-s>", "<Esc>:w<CR>:echo 'File saved!'<CR>i")

-- Keybinding for undo using: "CTRL Z"
keybind("i", "<C-z>", "<Esc>:undo<CR>i")

-- Keybinding for deleting line in "insert mode"
keybind("i", "<C-x>", "<Esc>dd<CR>i")

-- Keybinding for copy line in "insert mode"
keybind("i", "<C-c>", "<Esc><S-y><CR>i")

-- Keybinding for pasting in "insert mode"

keybind("i", "<C-v>", "<Esc>p<CR>i")

-- Keybinding for "write and quit" in insert mode:
keybind("i", "<C-q>", "<Esc>:wq<CR>")

-- Keybinding for displaying file explorer thru "Nvimtree plugin"
keybind("n", "e", ":NvimTreeToggle<CR>")

-- Keybinding for displaying terminal window
keybind("n", "t", ":ToggleTerm<CR>")
keybind("t", "<C-t>", ("exit<CR>"))

--autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif

-- LSP buffer hover bindings
