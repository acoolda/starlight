-- packer configuration
local fn = vim.fn

-- 自动安装packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- 保存plugin文件的时候自动更新插件
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- 检查是否安装packer 如果没有安装也不引发异常
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    -- open_fn = function()
    --   return require("packer.util").float { border = "rounded" }
    -- end,
  },
}
-- packer用法
-- use {
--   "myusername/example",        -- The plugin location string
--   -- The following keys are all optional
--   disable = boolean,           -- Mark a plugin as inactive
--   as = string,                 -- Specifies an alias under which to install the plugin
--   installer = function,        -- Specifies custom installer. See "custom installers" below.
--   updater = function,          -- Specifies custom updater. See "custom installers" below.
--   after = string or list,      -- Specifies plugins to load before this plugin. See "sequencing" below
--   rtp = string,                -- Specifies a subdirectory of the plugin to add to runtimepath.
--   opt = boolean,               -- Manually marks a plugin as optional.
--   branch = string,             -- Specifies a git branch to use
--   tag = string,                -- Specifies a git tag to use. Supports "*" for "latest tag"
--   commit = string,             -- Specifies a git commit to use
--   lock = boolean,              -- Skip updating this plugin in updates/syncs. Still cleans.
--   run = string, function, or table, -- Post-update/install hook. See "update/install hooks".
--   requires = string or list,   -- Specifies plugin dependencies. See "dependencies".
--   rocks = string or list,      -- Specifies Luarocks dependencies for the plugin
--   config = string or function, -- Specifies code to run after this plugin is loaded.
--   -- The setup key implies opt = true
--   setup = string or function,  -- Specifies code to run before this plugin is loaded.
--   -- The following keys all imply lazy-loading and imply opt = true
--   cmd = string or list,        -- Specifies commands which load this plugin. Can be an autocmd pattern.
--   ft = string or list,         -- Specifies filetypes which load this plugin.
--   keys = string or list,       -- Specifies maps which load this plugin. See "Keybindings".
--   event = string or list,      -- Specifies autocommand events which load this plugin.
--   fn = string or list          -- Specifies functions which load this plugin.
--   cond = string, function, or list of strings/functions,   -- Specifies a conditional test to load this plugin
--   module = string or list      -- Specifies Lua module names for require. When requiring a string which starts
--                                -- with one of these module names, the plugin will be loaded.
--   module_pattern = string/list -- Specifies Lua pattern of Lua module names for require. When
--   requiring a string which matches one of these patterns, the plugin will be loaded.
-- }

-- 插件安装
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- 基础插件，很多插件依赖这几个插件
  use "lewis6991/impatient.nvim" -- Speed up loading Lua modules    TODO: figure out how to use this
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "rcarriga/nvim-notify" -- notify
  use "kyazdani42/nvim-web-devicons" -- icons

  use "kyazdani42/nvim-tree.lua" -- file explore
  use {
    "akinsho/bufferline.nvim", -- tab
    tag = "v1.2.0",
  }

  use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use {
    "catppuccin/nvim",
    as = "catppuccin"
  }
  -- 状态栏
  use "nvim-lualine/lualine.nvim"
  -- easymotion
  use {
    "phaazon/hop.nvim",
    branch = "v1",
  }
  -- 对齐线
  use "lukas-reineke/indent-blankline.nvim"
  -- 括号成对
  use "windwp/nvim-autopairs"
  -- cmp 自动补全插件
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-nvim-lsp"
  use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }

  use "f3fora/cmp-spell" -- 拼写检查
  use "ray-x/cmp-treesitter"
  use "saadparwaiz1/cmp_luasnip"

  -- lsp server
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  use "ray-x/lsp_signature.nvim"
  use "stevearc/aerial.nvim"

  -- snippet
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"

  -- 经典插件
  use "tpope/vim-repeat"
  use "tpope/vim-surround"
  -- 颜色展示(rgb颜色展示)
  use "norcalli/nvim-colorizer.lua"
  -- todoList
  use "folke/todo-comments.nvim"
  -- 注释
  use "terrortylor/nvim-comment"
  -- 匹配增强，能匹配同一个代码block
  use "andymass/vim-matchup"

  -- treesitter 语法高亮
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use "nvim-treesitter/nvim-treesitter-textobjects"
  use "romgrk/nvim-treesitter-context"

  -- 终端
  use "akinsho/toggleterm.nvim"

  -- code action
  use "kosayoda/nvim-lightbulb"

  -- telescope
  use 'nvim-telescope/telescope.nvim'

  use "nvim-telescope/telescope-ui-select.nvim" -- TODO: not work
  use "nvim-telescope/telescope-live-grep-raw.nvim" -- HACK: not work
  use {
    "nvim-telescope/telescope-fzf-native.nvim", -- TODO: not work
    run = "make",
  }
  -- bookmark
  use "MattesGroeger/vim-bookmarks"
  use "tom-anders/telescope-vim-bookmarks.nvim"

  -- 预览图片
  -- use "nvim-telescope/telescope-media-files.nvim"
  -- which key
  use "folke/which-key.nvim"
  -- hight light v mode
  use "Pocco81/HighStr.nvim"
  -- 日志查看
  use "mtdl9/vim-log-highlighting"

  -- sinp run
  use { 'michaelb/sniprun', run = 'bash ./install.sh' }

  --查找替换功能
  use "nvim-pack/nvim-spectre"

  -- 项目管理
  use "ahmedkhalf/project.nvim"

  -- 欢迎界面
  use "goolord/alpha-nvim"

  -- winshift
  use "sindrets/winshift.nvim"
end)
