-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end,
    })

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('tpope/vim-fugitive')
    -- Allow plugins to enable repeating of commands
    use('tpope/vim-repeat')

    use("nvim-treesitter/nvim-treesitter-context");

    use("jwalton512/vim-blade");

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }

    -- Automatically add closing brackets, quotes, etc
    use({
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup()
        end,
    })

    -- All closing buffers without closing the split window
    use({
        'famiu/bufdelete.nvim',
        config = function()
            vim.keymap.set('n', '<leader>q', ':Bdelete<CR>')
        end,
    })

    -- Automatically fix indentation when pasting code
    use({
        'sickill/vim-pasta',
        config = function()
            vim.g.pasta_disable_filetypes = {'fugitive'}
        end,
    })

    -- Navigate seamlessly between Vim windows and Tmux panes
    use('christoomey/vim-tmux-navigator')

    -- Enable * searching with visually selected text
    use('nelstrom/vim-visual-star-search')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'hrsh7th/cmp-nvim-lsp-signature-help'},
            --
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        }
    }
    use('b0o/schemastore.nvim')

    use("github/copilot.vim")
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use {'ntpeters/vim-better-whitespace'}
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    -- use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    })
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { {"nvim-lua/plenary.nvim"} }
    }
    use {
        'laytan/cloak.nvim',
        config = function()
            require('cloak').setup()
        end
    }
end)
