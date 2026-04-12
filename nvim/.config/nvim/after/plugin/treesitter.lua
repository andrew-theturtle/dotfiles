-- Parser installation (async, no-op if already installed)
require('nvim-treesitter').install {
  'c', 'cpp', 'lua', 'vim', 'query', 'tsx', 'typescript',
  'javascript', 'python', 'php', 'make', 'cmake', 'bash', 'go',
  'markdown', 'markdown_inline',
}

-- Enable treesitter highlighting and indentation for all supported filetypes
vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    if pcall(vim.treesitter.start) then
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
