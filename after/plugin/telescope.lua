-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require("telescope").setup {
    defaults = {
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                preview_width = 0.4
            }
        },
        mappings = {
            i = {
                ["<C-u>"] = false,
                ["<C-d>"] = false
            }
        }
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
        }
    }
}

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")
require("telescope").load_extension("ui-select")

-- See `:help telescope.builtin`
vim.keymap.set("n", "<leader>?", require("telescope.builtin").builtin, {desc = "[?] Find build in files"})
vim.keymap.set("n", "<leader>fm", require("telescope.builtin").man_pages, {desc = "[F]ind [M]an pages"})
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, {desc = "[ ] Find existing buffers"})
vim.keymap.set("n", "<leader>ft", "<cmd>:TodoTelescope <CR>", {desc = "[F]ind [T]odo"})

vim.keymap.set(
    "n",
    "<leader>/",
    function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        require("telescope.builtin").current_buffer_fuzzy_find(
            {
                prompt_title = "Search",
                prompt_prefix = "> ",
                selection_strategy = "reset",
                sorting_strategy = "ascending",
                layout_strategy = "horizontal",
                layout_config = {
                    width = 0.6,
                    preview_width = 0.0
                }
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
