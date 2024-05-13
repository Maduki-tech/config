-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({"n", "v"}, "<Space>", "<Nop>", {silent = true})
vim.keymap.set("n", "<leader>tf", "<cmd>Neoformat <CR>", {silent = true})

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", {expr = true, silent = true})
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", {expr = true, silent = true})

-- Moving lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Yank to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete to system clipboard
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Quit and save
vim.keymap.set("n", "Q", vim.cmd.x)

-- rename word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Basic window Movement
vim.keymap.set("n", "<leader>d", "<cmd>:vsplit <CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>w", "<cmd>:split <CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>h", "<cmd>:wincmd h <CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>j", "<cmd>:wincmd j <CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>k", "<cmd>:wincmd k <CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>l", "<cmd>:wincmd l <CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>te", vim.cmd.TransparentToggle, {noremap = true, silent = true})

-- Undutree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.keymap.set("n", "<leader>ru", "<cmd>!./run<CR>", {noremap = true, silent = true})

vim.api.nvim_set_keymap("n", "<leader>dc", ":lua require('neogen').generate()<CR>", {noremap = true, silent = true})


-- run c file in debug
vim.keymap.set("n", "<leader>rc", ":w <CR> :!gcc -g % -o %<.o && ./%<.o <CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>rm", ":w <CR> :!make && ./a <CR>", {noremap = true, silent = true})

-- Debugging
vim.keymap.set("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<F9>", "<cmd>lua require'dap'.step_over()<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<F10>", "<cmd>lua require'dap'.step_into()<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<F12>", "<cmd>lua require'dap'.step_out()<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.open()<CR>", {noremap = true, silent = true})
