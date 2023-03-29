local builtin = require('telescope.builtin')
local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup {
    defaults = {
        preview = {
            treesitter = false,
        },
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
        },
    },
}

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {desc = 'Search Git files'})
vim.keymap.set('n', '<leader>gst', builtin.git_status, {desc = 'Git status'})
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, { desc = 'Lists all LSP [D]ocument [S]ymbols' })
vim.keymap.set('n', '<leader>ws', builtin.lsp_workspace_symbols, { desc = 'Lists all LSP [W]orkspace [S]ymbols' })
vim.keymap.set('n', '<leader>gr', builtin.lsp_references, { desc = 'Lists all LSP [R]eferences' })
vim.keymap.set('n', '<leader>ic', builtin.lsp_incoming_calls, { desc = 'Lists all LSP [I]ncoming [C]alls' })
vim.keymap.set('n', '<leader>oc', builtin.lsp_outgoing_calls, { desc = 'Lists all LSP [O]utgoing [C]alls' })
vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, { desc = 'Lists all LSP [D]efinitions' })
vim.keymap.set('n', '<leader>gi', builtin.lsp_implementations, { desc = 'Lists all LSP [I]mplementations' })
vim.keymap.set('n', '<leader>gt', builtin.lsp_type_definitions, { desc = 'Lists all LSP [T]ype Definitions' })
vim.keymap.set('n', '<leader>fn', builtin.treesitter, { desc = 'Lists [F]unction [N]ames, variables from Treesitter' })
vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })

telescope.load_extension('fzf')

