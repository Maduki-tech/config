require("neotest").setup(
    {
        adapters = {
            require("neotest-java")(
                {
                    ignore_wrapper = false, -- whether to ignore maven/gradle wrapper
                    junit_jar = "/Users/davidschluter/.local/share/nvim/neotest-java/junit-platform-console-standalone-1.10.1.jar"
                    -- default:
                }
            )
        }
    }
)

vim.keymap.set(
    "n",
    "<leader>tt",
    function()
        require("neotest").run.run()
    end,
    {noremap = true, silent = true}
)
vim.keymap.set(
    "n",
    "<leader>ts",
    function()
        require("neotest").summary.open();
    end,
    {noremap = true, silent = true}
)
