local opts = {noremap = true, silent = true }
local term_opts = { silent = true }

-- 设定keymap别名
local keymap = vim.api.nvim_set_keymap
-- ；在所有模式的功能取消
keymap("", ";", "<Nop>", opts)
-- ; 设定为leader键
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

-- Modes normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t", command_mode = "c",

-- Normal --
-- normal 模式下的窗口移动
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- NOTE: require winshit plugin
keymap("n", "<C-w>m",":WinShift<cr>",opts)

-- FileExpoler
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>f", ":NvimTreeFindFile<cr>", opts)

-- no highlight
keymap("n", "<leader>l", ":nohl<cr>", opts)
-- save buffer
keymap("n", "<leader>w", ":w<cr>", opts)
-- exit cur window
keymap("n", "<leader>q", ":q<cr>", opts)
-- delete cur buffer
keymap("n", "<leader>d", ":bdelete<cr>", opts)
keymap("n", "<leader>D", ":bdelete<cr>", opts)
-- goto next/previous buffer 
keymap("n","H",":bprevious<cr>",opts)
keymap("n","L",":bnext<cr>",opts)
-- keymap("n", "n", "nzzzv", opts)
-- keymap("n", "N", "Nzzzv", opts)
-- keymap("n", "J", "mzJ`z", opts)

-- Move text up and down
keymap("n", "˚", "<Esc>:m .-2<CR>", opts)
keymap("n", "∆", "<Esc>:m .+1<CR>", opts)

-- 多行移动
keymap("x", "∆", ":move '>+1<CR>gv-gv", opts)
keymap("x", "˚", ":move '<-2<CR>gv-gv", opts)
-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
-- 快速回到normal
keymap("i", "jk", "<ESC>", opts)
keymap("v", "p", '"_dP', opts)

-- telescope
-- 查找文件
keymap("n", "<leader>ff","<cmd>lua require('telescope.builtin').find_files()<CR>",opts)
keymap("n", "<leader>fg","<cmd>lua require('telescope.builtin').live_grep()<CR>",opts)

-- bookmark
keymap("n", "ma", "<cmd>Telescope vim_bookmarks current_file<cr>", opts)
keymap("n", "mA", "<cmd>Telescope vim_bookmarks all<cr>", opts)


-- calltree
keymap("n", "<leader>in", "<cmd>lua vim.lsp.buf.incoming_calls()<cr>", opts)

-- dap debugger相关

-- debug
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dB", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", opts)
-- keymap("n", "<leader>dr", "lua require'dap'.repl.open()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap('n', '<F10>', '<cmd>lua require"user.dap.dap-util".reload_continue()<CR>', opts)
keymap("n", "<F4>", "<cmd>lua require'dap'.terminate()<cr>", opts)
keymap("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<F6>", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<F7>", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<F8>", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "K", "<cmd>lua require'dapui'.eval()<cr>", opts)
