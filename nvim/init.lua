-- --- SETTINGS ---
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Relative numbers help with jumping lines
vim.opt.mouse = 'a'           -- Enable mouse support
vim.opt.ignorecase = true     -- Case insensitive searching
vim.opt.smartcase = true      -- ... unless uppercase used
vim.opt.termguicolors = true  -- Better colors
vim.opt.tabstop = 4           -- Tab size
vim.opt.shiftwidth = 4
vim.opt.expandtab = true      -- Spaces instead of tabs

-- --- PLUGIN MANAGER (Lazy.nvim) ---
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- --- PLUGINS ---
require("lazy").setup({
  -- Theme
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  
  -- Treesitter (Better Highlighting)
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Telescope (Fuzzy Finder)
  { "nvim-telescope/telescope.nvim", branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },
})

-- --- CONFIGURATION ---
vim.cmd.colorscheme "catppuccin"

-- Keybindings for Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Search Text' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Open Buffers' })
