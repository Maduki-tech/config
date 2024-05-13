require("go").setup({})

vim.keymap.set(
    "n",
    "<leader>rg",
    "<cmd>GoRun<CR>",
    {
        noremap = true,
        silent = true
    }
)
vim.keymap.set(
    "n",
    "<leader>tg",
    "<cmd>GoTest<CR>",
    {
        noremap = true,
        silent = true
    }
)
