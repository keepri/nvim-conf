-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        package.loaded["feline"] = nil
        package.loaded["catppuccin.groups.integrations.feline"] = nil
        require("feline").setup {
            components = require("catppuccin.groups.integrations.feline").get(),
        }
    end,
})

vim.g.mapleader = " "
-- vim.g.netrw_liststyle = 3
vim.opt.termguicolors = true

-- vim.opt.guicursor = "i:ver10"
vim.opt.guicursor = ""

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.list = false
vim.opt.wrapmargin = 0
vim.opt.breakat = ' '
vim.opt.breakindent = true
vim.opt.colorcolumn = '120'

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 9
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.diagnostic.config({
    virtual_text = true,
})
