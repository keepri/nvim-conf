local set = vim.keymap.set

vim.g.mapleader = " "

-- set("n", "<leader>kn", vim.cmd.Ex)
set("n", "<leader>kv", vim.cmd.Ex)
set("n", "<leader>ks", vim.cmd.Vex)
set("n", "<leader>kb", vim.cmd.Hex)
-- set("n", "<leader>kv", ":NERDTreeToggle<CR>")

-- move text
set("n", "J", "mzJ`z")
-- set("n", "K", "mzK`z")
set("v", "J", ":m '>+1<CR>gv=gv") -- up
set("v", "K", ":m '<-2<CR>gv=gv") -- down

-- navigation
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

-- greatest remap ever, paste and keep le buf
set("x", "<leader>p", [["_dP]])

set("n", "<leader>Y", [["+Y]])
set({ "n", "v" }, "<leader>y", [["+y]])
set({ "n", "v" }, "<leader>d", [["_d]])

set({ "n", "v" }, "<leader>f", vim.lsp.buf.format)
set({ "n", "v" }, "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Diagnostic keymaps
set('n', '[d', vim.diagnostic.goto_prev)
set('n', ']d', vim.diagnostic.goto_next)
set('n', '<leader>e', vim.diagnostic.open_float)
set('n', '<leader>q', vim.diagnostic.setloclist)
