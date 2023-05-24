local builtin = require('telescope.builtin')
local set = vim.keymap.set

-- require('telescope').setup {
--     extensions = {
--         fzf = {
--             fuzzy = true, -- false will only do exact matching
--             override_generic_sorter = true, -- override the generic sorter
--             override_file_sorter = true, -- override the file sorter
--             case_mode = "smart_case", -- or "ignore_case" or "respect_case"
--             -- the default case_mode is "smart_case"
--         }
--     }
-- }
--
-- require('telescope').load_extension('fzf')

set('n', '<leader>kf', builtin.find_files, {})
set('n', '<C-p>', builtin.git_files, {})
set("n", "<leader><space>", require('telescope.builtin').buffers, { desc = '[?] Find opened buffers' })
set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

set('n', '<leader>ks', function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end)
set("n", "<leader>?", function() builtin.oldfiles() end, { desc = '[?] Find recently opened files' })
set('n', '<leader>sw', function() builtin.live_grep({ grep_open_files = true }) end)
-- set('n', '<leader>sw', function() builtin.grep_string() end, { desc = '[S]earch current [W]ord' })
