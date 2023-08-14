local lsp = require('lsp-zero')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
local _ = require("luasnip.loaders.from_vscode").lazy_load()

lsp.preset('recommended')

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'rust_analyzer',
    'tailwindcss',
    'cssls',
    'jsonls',
})

cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

lsp.configure('tsserver', {
    capabilities = capabilities,
    settings = {
        completions = {
            completeFunctionCalls = true
        }
    }
})

-- Fix Undefined global 'vim'
-- lsp.configure('sumneko_lua', {
--     capabilities = capabilities,
--     settings = {
--         Lua = {
--             diagnostics = {
--                 globals = { 'vim' }
--             }
--         }
--     }
-- })

lsp.setup_nvim_cmp({ mapping = cmp_mappings })

lsp.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

---@diagnostic disable-next-line: unused-local
lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    local set = vim.keymap.set

    set("n", "gd", vim.lsp.buf.definition, opts)
    set("n", "K", vim.lsp.buf.hover, opts)
    set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
    set("n", "<leader>rn", vim.lsp.buf.rename)
    set("n", "<leader>ca", vim.lsp.buf.code_action)
    set({ "n", "v" }, "<leader>f", vim.lsp.buf.format)
end)

lsp.nvim_workspace({
    library = vim.api.nvim_get_runtime_file('', true)
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        focusable = false,
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})
