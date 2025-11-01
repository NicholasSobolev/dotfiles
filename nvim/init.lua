vim.g.mapleader = ' '

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

require("lazy").setup({
	spec = {
		{ import = "plugins" },
		{ import = "plugins.lsp" }
	},
})

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
vim.cmd(":hi statusline guibg=NONE")
vim.cmd([[set mouse=]])
vim.cmd([[set noswapfile]])


vim.opt.clipboard = 'unnamedplus'
vim.opt.winborder = "rounded"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.showtabline = 2
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.cursorcolumn = false
vim.opt.ignorecase = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.number = true
vim.opt.relativenumber = true

-- stylistic change for diagnostics
vim.diagnostic.config({
  virtual_text = {
    source = "if_many",  -- show source if multiple LSPs
    spacing = 2,         -- space between code and text
    prefix = "●",        -- or "■", "▶", ""
  },
})

vim.cmd [[set completeopt+=menuone,noselect,popup]]

local map = vim.keymap.set

-- keymaps
for i = 1, 8 do
	map({ "n", "t" }, "<Leader>" .. i, "<Cmd>tabnext " .. i .. "<CR>")
end
map({ "n", "v", "x" }, ";", ":", { desc = "Self explanatory" }) -- easier to reach
map({ "n", "v", "x" }, ":", ";", { desc = "Self explanatory" })
map({ "n", "v", "x" }, "<leader>v", "<Cmd>edit $MYVIMRC<CR>", { desc = "Edit " .. vim.fn.expand("$MYVIMRC") })

map("n", "<leader>o", function()
  for name,_ in pairs(package.loaded) do
    if name:match("^config") then
      package.loaded[name] = nil
    end
  end

  dofile(vim.fn.stdpath("config") .. "/init.lua")

  vim.notify("Config reloaded!", vim.log.levels.INFO)
end, { desc = "Reload Neovim config" })

map({ "n" }, "<leader>e", "<cmd>Oil<CR>")
map({ "n" }, "<leader>w", "<Cmd>update<CR>", { desc = "Write the current buffer." })
map({ "n" }, "<leader>q", "<Cmd>:quit<CR>", { desc = "Quit the current buffer." })
map({ "n" }, "<leader>Q", "<Cmd>:wqa<CR>", { desc = "Quit all buffers and write." })
map("n", "<leader>z", "<Cmd>edit ~/.zshrc<CR>", { desc = "Edit Zsh config" })
map({ "n", "t" }, "<Leader>t", "<Cmd>tabnew<CR>")
map({ "n", "t" }, "<Leader>x", "<Cmd>tabclose<CR>")

-- centering qol
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>pf", function()
  vim.cmd("write")

  -- path to Mason bin
  local prettier = vim.fn.stdpath("data") .. "/mason/bin/prettier"
  local file = vim.fn.expand("%:p")

  -- run prettier on the current file
  vim.fn.system({ prettier, "--write", file })

  vim.cmd("edit")

  print("Formatted with Prettier: " .. file)
end, { desc = "Format buffer with Prettier" })

-- lsp
require "mason".setup()
require("lsp")
