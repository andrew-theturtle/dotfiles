local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = false,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

-- require('lspconfig').volar.setup({
--     filetypes = {'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'vue'},
-- })

require('lspconfig').tailwindcss.setup{}
require('lspconfig').tsserver.setup{}
require('lspconfig').clangd.setup{}
require('lspconfig').phpactor.setup{}
require('lspconfig').lua_ls.setup{}
require('lspconfig').pylsp.setup{}

require('lspconfig').jsonls.setup({
    settings = {
        json = {
            schemas = require('schemastore').json.schemas(),
            validate = {enable = true},
        },
    },
})

lsp.on_attach(function(_, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end

		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end
    -- <C-O> to jump back to the previous cursor positions
    -- <C-I> to jump forward to the next cursor positions
    nmap('gl', vim.diagnostic.open_float, '')
    nmap('nd', vim.diagnostic.goto_next, 'Go to next diag mess')
    nmap('Nd', vim.diagnostic.goto_prev, 'Go to prev diag mess')
    nmap('K', vim.lsp.buf.hover, 'Show hover')
    nmap('<leader>ca', vim.lsp.buf.code_action, 'Code action')
    nmap('<leader>rn', vim.lsp.buf.rename, 'Rename')

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
		vim.lsp.buf.format()
	end, { desc = 'Format current buffer with LSP' })
end)
lsp.setup()
