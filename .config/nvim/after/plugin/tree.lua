require('nvim-tree').setup()
local api = require('nvim-tree.api')

vim.keymap.set("n", "<leader>pv", function()
    api.tree.toggle()
end)
