require("tabnine").setup({
        disable_auto_comment = false,
        accept_keymap = nil,
        dismiss_keymap = nil,
        debounce_ms = 800,
        suggestion_color = {gui = "#808080", cterm = 244},
        exclude_filetypes = {"TelescopePrompt", "NvimTree"},
        log_file_path = nil -- absolute path to Tabnine log file
    }
)
