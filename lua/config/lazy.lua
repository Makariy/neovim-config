
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


local plenary = require("config.plenary")

local theme = require("config.theme")
local nvim_tree = require("config.nvim_tree")

local project = require("config.project")

local autosave = require("config.autosave")
local autosession = require("config.auto_session")

-- Completition and lsp 
local treesitter = require("config.treesitter")
local treesitter_textobjects = require("config.treesitter_textobjects")
local treesitter_context = require("config.treesitter_context")

local lspconfig = require("config.nvim_lspconfig")
local mason = require("config.mason")
local mason_lspconfig = require("config.mason_lspconfig")

local nvim_cmp = require("config.nvim_cmp")
local splitjoin = require("config.splitjoin")
local comment = require("config.comment")

local undotree = require("config.undotree")

-- Telescope 
local telescope = require("config.telescope")

-- Harpoon
local harpoon = require("config.harpoon")

-- Debug 
local nvim_dap = require("config.nvim_dap")
local nvim_dap_ui = require("config.nvim_dap_ui")

-- Git 
local vim_fugitive = require("config.vim_fugitive")
local gitsigns = require("config.gitsigns")


-- Setup 
require("lazy").setup({
	plenary, 

	theme,
	nvim_tree,

	project,

	autosave,
	autosession,

	treesitter,
	treesitter_textobjects,
	treesitter_context,

	lspconfig,
	mason,
	mason_lspconfig,
		
	nvim_cmp,
	splitjoin,
	comment,

	undotree,

	telescope,
	harpoon,

	nvim_dap,
	nvim_dap_ui,

	vim_fugitive,
	gitsigns,
})

