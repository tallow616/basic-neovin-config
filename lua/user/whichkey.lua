local wk = require("which-key")
wk.add({
    { "<leader>f",  group = "File" }, -- group
    { "<leader>ff", "<cmd>Telescope find_files<cr>",            desc = "Find File", },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>",              desc = "Recent Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>",             desc = "Live Grep" },
    { "<leader>f1", "<cmd>Telescope buffers<cr>",               desc = "Buffer" }, -- hide this keymap

    { "<leader>b",  group = "Buffers", },
    { "<leader>bc", "<cmd>enew<cr>",                            desc = "New Buffer" },
    { "<leader>bn", "<cmd>bnext<cr>",                           desc = "Next Buffer" },
    { "<leader>bp", "<cmd>bprevious<cr>",                       desc = "Previous Buffer" },
    { "<leader>bd", "<cmd>bdelete<cr>",                         desc = "Delete Buffer" },

    { "<leader>l",  group = "LSP", },
    { "<leader>ld", "<cmd>Telescope lsp_definitions<cr>",       desc = "LSP Definitions" },
    { "<leader>lr", "<cmd>Telescope lsp_references<cr>",        desc = "LSP References" },
    { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>",  desc = "LSP Document Symbols" },
    { "<leader>lw", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "LSP Workspace Symbols" },
    { "<leader>la", "<cmd>lua vim.lsp.buf.code.hover()<cr>",    desc = "LSP Hover" },
    { "<leader>lR", "<cmd>lua vim.lsp.buf.rename()<cr>",        desc = "LSP Rename" },
    { "<leader>lA", "<cmd>lua vim.lsp.buf.code.action()<cr>",   desc = "LSP Code Action" },


    {
        -- Nested mappings are allowed and can be added in any order
        -- Most attributes can be inherited or overridden on any level
        -- There's no limit to the depth of nesting
        mode = { "n", "v" },                          -- NORMAL and VISUAL mode
        { "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
        { "<leader>w", "<cmd>w<cr>", desc = "Write" },
    },
})
