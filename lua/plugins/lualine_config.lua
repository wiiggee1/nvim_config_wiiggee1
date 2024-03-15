require("lualine").setup {
    options = {
      icons_enabled = true,
<<<<<<< HEAD
      theme = "onedark",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {},
=======
      theme = "nord",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
          "NvimTree",
          statusline = {},
          winbar = {},
      },
      always_divide_middle = true,
      refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
      }
>>>>>>> origin/master
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = {{ "filename", file_status = true, path = 0 }},
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = {},
  }

