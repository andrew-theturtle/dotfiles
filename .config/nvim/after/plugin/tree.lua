require('nvim-tree').setup()
local api = require('nvim-tree.api')

vim.keymap.set("n", "<leader>pv", function()
    api.tree.toggle({ find_file = true, focus = true, open = true, path = vim.fn.expand("%:p:h") })
end)
