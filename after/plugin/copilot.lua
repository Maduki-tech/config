local status_ok, copilot = pcall(require, "copilot")
if not status_ok then
    return
end

copilot.setup {
    cmp = {
        enabled = true,
        method = "getCompletionsCycling"
    },
    panel = {
        -- no config options yet
        enabled = true
    },
    suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
            accept = "<S-Tab>"
        }
    },
    ft_disable = {"markdown"},
    -- plugin_manager_path = vim.fn.stdpath "data" .. "/site/pack/packer",
    server_opts_overrides = {
        -- trace = "verbose",
        settings = {
            advanced = {
                -- listCount = 10, -- #completions for panel
                inlineSuggestCount = 3 -- #completions for getCompletions
            }
        }
    }
}

-- Keymaps
vim.keymap.set("n", "<leader>cc", "<cmd>Copilot toggle<CR>", {silent = false})
