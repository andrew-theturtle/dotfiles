require('nvim-tree').setup({
    git = {
        ignore = false,
    },
    renderer = {
        highlight_opened_files = 'none',
        group_empty = true,
        icons = {
            show = {
                folder_arrow = false,
            },
        },
        indent_markers = {
            enable = true,
        }
    },
})

vim.keymap.set("n", "<leader>pv", ':NvimTreeFindFileToggle<CR>')

