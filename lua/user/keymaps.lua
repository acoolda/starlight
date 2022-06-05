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
