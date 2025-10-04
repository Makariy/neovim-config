
local function load_project_config()
  local cwd = vim.fn.getcwd()
  local project_config = cwd .. "/.nvim.lua"

  if vim.fn.filereadable(project_config) == 1 then
    dofile(project_config)
  end
end 


vim.o.updatetime = 100

vim.g.mapleader = " " 
vim.g.maplocalleader = "," 

vim.g.mouse=true 
vim.g.encoding="utf-8"
vim.wo.number=true 
vim.wo.relativenumber=true

-- vim.wo.cursorline=true
vim.g.noswapfile=true 
vim.opt.scrolloff=7

vim.g.fileformat=unix

vim.g.expandtab=true 
vim.opt.tabstop=4
vim.opt.shiftwidth=4

vim.g.autoindent=true 
vim.g.smartindent=true 
vim.opt.copyindent=true
vim.opt.preserveindent = true

vim.opt.diffopt:append("context:99999999")

--vim.g.netrw_banner=0 
--vim.g.netrw_liststyle=3
--vim.g.netrw_browse_split=3

vim.o.sessionoptions = "buffers,curdir,folds,globals,tabpages,winpos,winsize"

-- Create russian mapping to use vi commands with russian keyboard 
vim.cmd [[
	set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
]]

-- theme 
vim.opt.termguicolors = true
vim.cmd.colorscheme "vscode"

-- Auto-wrap text at 80 characters for markdown and text files
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "markdown", "text" },
--   callback = function()
--     vim.opt_local.textwidth = 80      -- wrap lines at 80 characters
--     -- vim.opt_local.wrap = true         -- enable line wrapping
--     vim.opt_local.formatoptions:append("t")  -- auto-wrap text while typing
--     vim.opt_local.formatoptions:append("t") -- auto-wrap while typing
--     vim.opt_local.formatoptions:append("a") -- auto-wrap on paste
--     vim.opt_local.formatoptions:append("j") -- remove comment leader when joining lines
--     vim.opt_local.formatoptions:append("n") -- smart comment formatting
--   end 
-- })


vim.api.nvim_create_autocmd("DirChanged", {
  callback = function(args)
    local cwd = args.file
    local project_config = cwd .. "/.nvim.lua"
    if vim.fn.filereadable(project_config) == 1 then
      vim.print("Here")
      dofile(project_config)
    end
  end,
})

vim.diagnostic.config({
  underline = true,
  update_in_insert = true, 
  severity_sort = true,
})

load_project_config()


