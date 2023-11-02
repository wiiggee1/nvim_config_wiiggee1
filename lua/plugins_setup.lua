-- Protected call 
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
    use 'mfussenegger/nvim-dap'
    use 'mfussenegger/nvim-jdtls'
    use 'jay-babu/mason-nvim-dap.nvim'
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use 'theHamsta/nvim-dap-virtual-text'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }


    use('OmniSharp/omnisharp-vim')
 
    use {'windwp/nvim-autopairs',
        config = function () require("nvim-autopairs").setup {} end
    }
    use 'windwp/nvim-ts-autotag'

    use('akinsho/toggleterm.nvim')
    use('akinsho/nvim-bufferline.lua')
  
    use('nvim-lualine/lualine.nvim')
    use('kyazdani42/nvim-web-devicons')
  
    use {
        'nvim-tree/nvim-tree.lua', tag = 'nightly',
        requires = {'nvim-tree/nvim-web-devicons'}
    }

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

end)


