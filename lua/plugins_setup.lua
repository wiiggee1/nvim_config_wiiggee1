-- Protected call 
local status, packer = pcall(require, "packer")
if (not status) then
    return
end

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

  -- My plugins here
    use({"catppuccin/nvim", as = "catppucciin"})

    use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use('OmniSharp/omnisharp-vim')
    
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'

    use('akinsho/toggleterm.nvim')
    use('akinsho/nvim-bufferline.lua')
  
    use('nvim-lualine/lualine.nvim')
    use('kyazdani42/nvim-web-devicons')
  

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
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

    use('vimwiki/vimwiki') 

    
    -- Autocompletion & lsp
    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-path')
    use('hrsh7th/cmp-nvim-lsp')
    use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
    
    use({
        "glepnir/lspsaga.nvim",
         branch = "main",
         config = function()
            require("lspsaga").setup({})
        end,
        requires = { {"nvim-tree/nvim-web-devicons"} }
    })

    -- snippets1
    use('L3MON4D3/LuaSnip')
    use('saadparwaiz1/cmp_luasnip')
    use('rafamadriz/friendly-snippets')

    use('nvim-lua/plenary.nvim')
    
end)   


