-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require("telescope").setup {
    defaults = {
        mappings = {
            i = {
                ["<C-u>"] = false,
                ["<C-d>"] = false
            }
        }
    }
}

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")

-- See `:help telescope.builtin`
vim.keymap.set("n", "<leader>?", require("telescope.builtin").builtin, {desc = "[?] Find build in files"})
vim.keymap.set("n", "<leader>fm", require("telescope.builtin").man_pages, {desc = "[F]ind [M]an pages"})
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, {desc = "[ ] Find existing buffers"})
vim.keymap.set(
    "n",
    "<leader>/",
    function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        require("telescope.builtin").current_buffer_fuzzy_find(
            require("telescope.themes").get_dropdown {
                winblend = 10,
                previewer = false
            }
        )
    end,
    {desc = "[/] Fuzzily search in current buffer"}
)

vim.keymap.set("n", "<leader>fg", require("telescope.builtin").git_files, {desc = "Search [G]it [F]iles"})
vim.keymap.set("n", "<leader>fs", require("telescope.builtin").find_files, {desc = "[F]iles [S]earch "})
vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, {desc = "[S]earch [H]elp"})
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, {desc = "[S]earch current [W]ord"})
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, {desc = "[S]earch by [G]rep"})
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, {desc = "[S]earch [D]iagnostics"})
vim.keymap.set("n", "<leader>sr", require("telescope.builtin").resume, {desc = "[S]earch [R]esume"})
