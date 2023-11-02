---
-- Configure LSP servers
---
--require'lspconfig'.sumneko_lua.setup()
require('lsp-zero').extend_lspconfig()

require('mason').setup()
require('mason-lspconfig').setup()
require("mason-nvim-dap").setup()

local get_servers = require('mason-lspconfig').get_installed_servers
for _, server_name in ipairs(get_servers()) do
    require('lspconfig')[server_name].setup({})
end

---
-- Diagnostic config
---

require('lsp-zero').set_sign_icons()
--vim.diagnostic.config(require('lsp-zero').defaults.diagnostics({}))

---
-- Snippet config
---

require('luasnip').config.set_config({
    region_check_events = 'InsertEnter',
    delete_check_events = 'InsertLeave'
})

require('luasnip.loaders.from_vscode').lazy_load()

---
-- Autocompletion
---

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local cmp = require('cmp')
local cmp_config = require('lsp-zero').defaults.cmp_config({})

cmp_config.mapping = cmp.mapping.preset.insert({
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm { select = false }
})

--cmp.setup(cmp_config)
cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },

    formatting = {
        fields = {'abbr', 'kind', 'menu'},
        format = require('lspkind').cmp_format({
            mode = 'symbol', -- show only symbol annotations
            maxwidth = 15, -- prevent the popup from showing more than provided characters
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
        })
    }
})

-- JAVA "jdtls" LSP setup

--require('jdtls').setup()

-- Turn on lsp status information
require('fidget').setup()

-- rust analyzer link projects


local rt = require("rust-tools")
local mason_registry = require("mason-registry")
local codelldb = mason_registry.get_package("codelldb")
local extension_path = codelldb:get_install_path() .. "/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"

local opts = {
    dap = {
        adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
    },
    server = {
        standalone = true,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        on_attach = function(client, bufnr)
            require("nvim-navic").attach(client, bufnr)
        end,
        checkOnSave = {
            allFeatures = true,
            overrideCommand = {
                "cargo",
                "clippy",
                "--workspace",
                "--message-format=json",
                "--all-targets",
                "--all-features",
            },
        },
    },
}

rt.setup(opts)
