vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

local Maduki_Fugitive = vim.api.nvim_create_augroup("Maduki_Fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd(
    "BufWinEnter",
    {
        group = Maduki_Fugitive,
        pattern = "*",
        callback = function()
            if vim.bo.ft ~= "fugitive" then
                return
            end

            local bufnr = vim.api.nvim_get_current_buf()
            local opts = {buffer = bufnr, remap = false}
            vim.keymap.set(
                "n",
                "<leader>p",
                function()
                    vim.cmd.Git("push")
                end,
                opts
            )

            -- rebase always
            vim.keymap.set(
                "n",
                "<leader>P",
                function()
                    vim.cmd.Git({"pull", "--rebase"})
                end,
                opts
            )

            -- NOTE: It allows me to easily set the branch i am pushing and any tracking
            -- needed if i did not set the branch up correctly
            vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts)
        end
    }
)

vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>:G<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>gp", "<cmd>:Git push<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>gh", "<cmd>:diffget //3<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>gf", "<cmd>:diffget //2<CR>", {noremap = true, silent = true})
