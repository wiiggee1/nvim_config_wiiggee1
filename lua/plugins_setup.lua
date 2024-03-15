<<<<<<< HEAD
-- Protected call 
=======
--vim.cmd [[packadd packer.nvim]]

-- Bootstrapping for automatically install and setup 'packer.nvim'
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

>>>>>>> origin/master
local status, packer = pcall(require, "packer")
if (not status) then
    return
end

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
   
    use({
      "folke/trouble.nvim",
      config = function()
          require("trouble").setup {
              height = 10, 
              icons = false,
              mode = "workspace_diagnostics",
              padding = true, -- add an extra new line on top of the list
              cycle_results = true, 
              auto_preview = true,
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
              fold_open = "v", -- icon used for open folds
              fold_closed = ">", -- icon used for closed folds
            indent_lines = true, -- add an indent guide below the fold icons
            signs = {
        -- icons / text used for a diagnostic
                error = "error",
                warning = "warn",
                hint = "hint",
                information = "info"
            },
            auto_open = false,  -- Automatically open the trouble list on error
            auto_close = false, -- Automatically close the trouble list when it's empty
            use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
          }
      end
    })

  -- My plugins here
    use {"catppuccin/nvim", as = "catppuccin"}
<<<<<<< HEAD
    use 'puremourning/vimspector'
    use 'mfussenegger/nvim-dap'
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
=======
    use 'mfussenegger/nvim-dap'
    use 'mfussenegger/nvim-jdtls'
    use 'jay-babu/mason-nvim-dap.nvim'
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use 'theHamsta/nvim-dap-virtual-text'
>>>>>>> origin/master

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

<<<<<<< HEAD
    use('OmniSharp/omnisharp-vim')
 
=======
>>>>>>> origin/master
    use {'windwp/nvim-autopairs',
        config = function () require("nvim-autopairs").setup {} end
    }
    use 'windwp/nvim-ts-autotag'

    use('akinsho/toggleterm.nvim')
    use('akinsho/nvim-bufferline.lua')
<<<<<<< HEAD
  
    use('nvim-lualine/lualine.nvim')
    use('kyazdani42/nvim-web-devicons')
  
=======
    use('nvim-lualine/lualine.nvim')
    use('kyazdani42/nvim-web-devicons')  
>>>>>>> origin/master
    use {
        'nvim-tree/nvim-tree.lua', tag = 'nightly',
        requires = {'nvim-tree/nvim-web-devicons'}
    }
<<<<<<< HEAD

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    use { -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        requires = {
            -- Automatically install LSPs to stdpath for neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Useful status updates for LSP
            'j-hui/fidget.nvim',

            -- Additional lua configuration, makes nvim stuff amazing
            'folke/neodev.nvim',
        },
    }
    
    use 'simrat39/rust-tools.nvim'

    use('vimwiki/vimwiki')

    use 'onsails/lspkind.nvim' -- vs-code like icons for autocompletion

    use {
	    'VonHeikemen/lsp-zero.nvim',
	    branch = 'v1.x',
	    requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
=======
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use {'j-hui/fidget.nvim', tag = 'v1.0.0'}
    use 'simrat39/rust-tools.nvim'
    use 'onsails/lspkind.nvim' -- vs-code like icons for autocompletion
    use ({'folke/neodev.nvim',})
    use({
        'folke/todo-comments.nvim',
        requires = {"nvim-lua/plenary.nvim"}
    })

    use {
	    'VonHeikemen/lsp-zero.nvim',
	    branch = 'v3.x',
	    requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {
              'williamboman/mason.nvim', 
              run = function()
                  pcall(vim.cmd, 'MasonUpdate')
              end, 
          },
>>>>>>> origin/master
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
<<<<<<< HEAD
		  {'rafamadriz/friendly-snippets'},
	    }
  }

    use({
        "nvimdev/lspsaga.nvim",
        after = "nvim-lspconfig",
        config = function()
            require("lspsaga").setup({})
        end,
    })
=======
		  --{'rafamadriz/friendly-snippets'},
	    }
  }
  -- Automatically set up your configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
>>>>>>> origin/master

end)


