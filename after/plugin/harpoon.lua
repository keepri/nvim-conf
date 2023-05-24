local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local map = vim.keymap.set

map("n", "<leader>a", mark.add_file)
map("n", "<C-e>", ui.toggle_quick_menu)

map("n", "<leader>h1", function() ui.nav_file(1) end)
map("n", "<leader>h2", function() ui.nav_file(2) end)
map("n", "<leader>h3", function() ui.nav_file(3) end)
map("n", "<leader>h4", function() ui.nav_file(4) end)
map("n", "<leader>h5", function() ui.nav_file(5) end)
map("n", "<leader>h6", function() ui.nav_file(6) end)
map("n", "<leader>h7", function() ui.nav_file(7) end)
map("n", "<leader>h8", function() ui.nav_file(8) end)
map("n", "<leader>h9", function() ui.nav_file(9) end)
