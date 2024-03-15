-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

<<<<<<< HEAD
=======
--TODO: 
-- * Fix the keybinding for toggle nvim-tree in the nvim-tree.view buffer
>>>>>>> origin/master

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
<<<<<<< HEAD
  view = {
    adaptive_size = true,
=======
  update_cwd = true,
  hijack_cursor = true,
  view = {
    adaptive_size = false,
    signcolumn = "no",
    width = 20,
>>>>>>> origin/master
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
<<<<<<< HEAD
    group_empty = true,
  },
=======
    full_name = true, 
    highlight_git = true,
    special_files = {},
    symlink_destination = false,
    indent_markers = {
        enable = true,
    },
    group_empty = true,
  },
  diagnostics = {
      enable = true,
      show_on_dirs = false,
  },
>>>>>>> origin/master
  filters = {
    dotfiles = true,
  },
})



