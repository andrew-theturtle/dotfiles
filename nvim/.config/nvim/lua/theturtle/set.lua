-- vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- complete the longest common match, and allow tabbing the results to fully
-- complete them
vim.o.wildmode = 'longest:full,full'

-- Set title of window to show file name
vim.o.title = true

vim.o.spell = true

vim.o.splitbelow = true
vim.o.splitright = true

-- ask for confirmation instead of showing error
vim.o.confirm = true

-- persistent undo
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

