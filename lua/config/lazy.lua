
-- Initialize Lazy 
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)


local theme = require("config.theme")
local nvim_tree = require("config.nvim_tree")
local bufferline = require("config.bufferline")

local autosession = require("config.auto_session")

-- Completition and lsp 
local treesitter = require("config.treesitter")
local lsp_config = require("config.nvim_lspconfig")
local nvim_cmp = require("config.nvim_cmp")

-- Telescope 
local telescope = require("config.telescope")

-- Debug 
local nvim_dap = require("config.nvim_dap")
local nvim_dap_ui = require("config.nvim_dap_ui")

-- Git 
local vim_fugitive = require("config.vim_fugitive")
local gitsigns = require("config.gitsigns")


-- Setup 
require("lazy").setup({
	-- Theme 
	theme,
	nvim_tree,
	bufferline,

	autosession,

	treesitter,
	lsp_config,
	nvim_cmp,

	telescope,

	nvim_dap,
	nvim_dap_ui,

	vim_fugitive,
	gitsigns,
})

