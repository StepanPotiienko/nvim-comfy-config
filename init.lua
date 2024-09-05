local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
require("vim-options")

require'lspconfig'.pyright.setup{}

vim.cmd("set norelativenumber")
vim.cmd("set number")

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")

  vim.g.mapleader = ""

  local plugins = {
  { 'echasnovski/mini.nvim', version = '*' },
  {"nvim-telescope/telescope.nvim", tag="0.1.5", dependencies={'nvim-lua/plenary.nvim'}},
  {"nvim-treesitter/nvim-treesitter", build=":TSUpdate"},
  {"nvim-neo-tree/neo-tree.nvim", branch="v3.x", dependencies={"nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim"}
  },
}

require('mini.animate').setup()

local opts = {}
require("lazy").setup(plugins, opts)

require("toggleterm").setup()
vim.keymap.set('n', '<C-t>', ":ToggleTerm size=50 dir=./ direction=float name='Cool looking terminal'")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = {"lua", "go", "vim", "rust", "typescript", "javascript", "python"},
  highlight = {enable = true},
  indent = {enable = true}
})

