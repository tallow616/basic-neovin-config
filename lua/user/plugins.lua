-- plugins.lua
-- Bootstrap Lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    print("Installing lazy.nvim...")
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
    print("Lazy.nvim installed!")
end
vim.opt.rtp:prepend(lazypath)

-- Plugin specifications
return require("lazy").setup({
    -- Essential plugins
    "nvim-lua/plenary.nvim", -- Utility functions (dependency for many plugins)

    -- Treesitter for syntax highlighting (load early)
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        priority = 100, -- Load early
    },

    -- Language Server Protocol support
    {
        "neovim/nvim-lspconfig", -- Base LSP configurations
        dependencies = {
            -- Server installation manager
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
    },

    -- Autocompletion system
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",     -- LSP source for nvim-cmp
            "hrsh7th/cmp-buffer",       -- Buffer source
            "hrsh7th/cmp-path",         -- Path source
            "L3MON4D3/LuaSnip",         -- Snippet engine
            "saadparwaiz1/cmp_luasnip", -- Snippet source
        },
    },

    -- Fuzzy finder
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    -- Key binding helper
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            timeout = 300,
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },

    -- Theme (load last after all functionality is configured)
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000, -- Load last
    },
})
