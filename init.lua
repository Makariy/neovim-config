
vim.g.mapleader = " " 
vim.g.maplocalleader = "," 

vim.g.mouse=true 
vim.g.encoding="utf-8"
vim.wo.number=true 
vim.wo.relativenumber=true

-- vim.wo.cursorline=true
vim.g.noswapfile=true 
vim.opt.scrolloff=7

vim.g.expandtab=true 
vim.g.fileformat=unix

vim.g.expandtab=true 
vim.opt.tabstop=4
vim.opt.shiftwidth=4

vim.g.autoindent=true 
vim.g.smartindent=true 
vim.opt.copyindent=true
vim.opt.preserveindent = true

--vim.g.netrw_banner=0 
--vim.g.netrw_liststyle=3
--vim.g.netrw_browse_split=3

vim.o.sessionoptions = "buffers,curdir,folds,globals,tabpages,winpos,winsize"

-- Create russian mapping to use vi commands with russian keyboard 
vim.cmd [[
	set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
]]


-- Autosave file when typing 
local timer = vim.loop.new_timer()
vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
    callback = function()
        timer:stop()
        timer:start(500, 0, vim.schedule_wrap(function()
            if vim.bo.modifiable and vim.bo.buftype == "" and vim.fn.expand('%') ~= "" then
                vim.cmd("silent write")
            end
        end))
    end,
})
-- Open help on <Leader>h 
vim.api.nvim_set_keymap('n', '<Leader>h', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { noremap = true, silent = true })



-- Auto-wrap text at 80 characters for markdown and text files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text" },
  callback = function()
    vim.opt_local.textwidth = 80      -- wrap lines at 80 characters
    vim.opt_local.wrap = true         -- enable line wrapping
    vim.opt_local.formatoptions:append("t")  -- auto-wrap text while typing
    vim.opt_local.formatoptions:append("t") -- auto-wrap while typing
    vim.opt_local.formatoptions:append("a") -- auto-wrap on paste
    vim.opt_local.formatoptions:append("j") -- remove comment leader when joining lines
    vim.opt_local.formatoptions:append("n") -- smart comment formatting
  end
})

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


-- Show help after 250ms of cursor hover 
vim.o.updatetime = 250
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
  callback = function ()
    vim.diagnostic.open_float(nil, {focus=false})
  end
})


require("lazy").setup({
	-- For themes 
	{
		"Mofiqul/vscode.nvim",
	},
	{
  	  'akinsho/bufferline.nvim',
  	  version = "*",
  	  dependencies = 'nvim-tree/nvim-web-devicons',
  	  config = function()
    	bufferline = require("bufferline")
    	bufferline.setup {
      	  options = {
        	mode = "tabs", -- or "buffers"
        	separator_style = {" ", " "}, -- "slant", "thick", "thin", "padded_slant", etc.
        	show_close_icon = false,
        	show_buffer_close_icons = false,
        	color_icons = true,
            style_preset = {
                bufferline.style_preset.no_italic,
                bufferline.style_preset.no_bold
            },
      	  }
    	}
  	  end
	},
	-- Dependency for syntax checker 
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
	{
	  "nvim-tree/nvim-tree.lua",
	  dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional icons
	  config = function()
		require("nvim-tree").setup({
		  view = {
			side = "left",
			width = 35,
			preserve_window_proportions = true,
			relativenumber = true
		  },
		  renderer = {
			highlight_git = true,
			highlight_opened_files = "all",
		  },
		  actions = {
			open_file = {
			  quit_on_open = true,
			  resize_window = true,
			},
		  },
		  update_focused_file = {
			enable = true,
			update_cwd = true,
		  },
		  git = {
			enable = true,
			ignore = false,
		  },
		})
	  end,
	},
	{
  	  'rmagatti/auto-session',

  	  opts = {
  	  	lazy_support = true,
    	auto_restore_last_session = false,
  	  }
    },
    {
  	  "tpope/vim-fugitive",
	},
	-- Dependency for completition
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			-- install different completion source
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "path" },
				}),
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.elixirls.setup({
				cmd = { "elixir-ls" },
				settings = {
					elixirLS = {
					    dialyzerEnabled = true, 
					    fetchDeps = false
					}
				}
			})
			lspconfig.pyright.setup({
				on_attach = function(client, bufnr)
					local opts = {}
					-- Additional useful mappings
					vim.api.nvim_buf_set_keymap(bufnr, "n", "H", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
					vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
					vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
					vim.api.nvim_buf_set_keymap(bufnr, "n", '<leader>i', "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
				end,
				capabilities = require("cmp_nvim_lsp").default_capabilities(), -- Enable LSP with cmp
				settings = {
					python = {
						analysis = {
							autoSearchPaths = true,
							diagnosticMode = "workspace",
							useLibraryCodeForTypes = true,
							autoImportCompletions = true,
							typeCheckingMode = "basic",
							extraPaths = {} -- Add custom paths if needed
						}
					}
				}
			})
--			lspconfig.clangd.setup({
--			  cmd = { "clangd" }, -- Ensure 'clangd' is in your PATH or provide its full path
--			  filetypes = { "c", "cpp", "objc", "objcpp" },
--			  on_attach = function(client, bufnr)
--				-- Enable LSP keybindings and features here (optional)
--				local opts = { noremap = true, silent = true }
--				local buf_set_keymap = vim.api.nvim_buf_set_keymap
--
--				buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
--				buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
--				buf_set_keymap(bufnr, 'n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
--			  end,
--			  capabilities = require('cmp_nvim_lsp').default_capabilities() -- Optional: Add nvim-cmp support
--			})
		end,
	},
	{
	    "nvim-telescope/telescope.nvim",
	  	tag = "0.1.4",
	  	dependencies = { "nvim-lua/plenary.nvim" },
	  	config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set('n', '<leader>fu', builtin.lsp_references, {})     -- View usages
			vim.keymap.set('n', '<leader>fd', builtin.lsp_definitions, {})    -- Go to definition
	  	end,
	},
	-- Core debugging plugin
	{
	  "mfussenegger/nvim-dap",
	  config = function()
		local dap = require("dap")
		dap.adapters.python = {
		  type = 'executable',
		  command = 'python',
		  args = { '-m', 'debugpy.adapter' },
		}
		vim.fn.sign_define('DapBreakpoint', {
		  text = '●',         -- Unicode red circle
		  texthl = 'DapBreakpoint',
		  linehl = '',
		  numhl = ''
		})
		vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = '#FF5555' })
	  end
	},
	-- UI for debugging
	{
	  "rcarriga/nvim-dap-ui",
	  dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio"
	  },
	  config = function()
		local dap, dapui = require("dap"), require("dapui")
		dapui.setup({
			layouts = {
				{
				  elements = {
					{ id = "scopes", size = 0.7 },
					{ id = "stacks", size = 0.3 },
				  },
				  size = 40, -- Width of the left panel
				  position = "left",
				},
				{
				  elements = {
					{ id = "repl", size = 1.0 },
				  },
				  size = 15, -- Height of the bottom panel
				  position = "bottom",
				},
			},
		})
		dap.listeners.after.event_initialized["dapui_config"] = function()
		  dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
		  dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
		  dapui.close()
		end
	  end
	}


})


-- theme 
vim.opt.termguicolors = true
vim.cmd.colorscheme "vscode"


-- setup key bindings 
local dap = require("dap")
local dapui = require("dapui")

-- binding for file tree view 
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', {})

-- bind no highlight 
vim.keymap.set('n', '<leader>n', ':noh<CR>', {})

-- bind tab switch 
vim.keymap.set('n', '<A-Right>', ':tabnext<CR>', { silent = true })
vim.keymap.set('n', '<A-Left>', ':tabprevious<CR>', { silent = true })


-- binding for telescope 
local telescope = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = 'Telescope live grep' })

-- binding for debug 
vim.keymap.set('n', '<Leader>dc', function() dap.continue() end)
vim.keymap.set('n', '<Leader>do', function() dap.step_over() end)
vim.keymap.set('n', '<Leader>di', function() dap.step_into() end)
vim.keymap.set('n', '<Leader>dO', function() dap.step_out() end)
vim.keymap.set('n', '<Leader>db', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end)
vim.keymap.set('n', '<Leader>du', function() dapui.toggle() end)
vim.keymap.set('n', '<Leader>dt', function() dap.terminate() end)



-- git mappings 

vim.keymap.set('n', '<leader>gg', function()
  -- Check if Gdiffsplit is already open by looking for fugitive buffers
  local found = false
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    local name = vim.api.nvim_buf_get_name(buf)
    if name:match("fugitive://") then
      found = true
      break
    end
  end

  if found then
    vim.cmd("wincmd o")  -- Close other windows (including Gdiff)
  else
    vim.cmd("Gvdiffsplit!")
  end
end, { desc = "Toggle Gvdiffsplit" })


vim.keymap.set("n", "<leader>gl", ":diffget //2<CR>", { desc = "Get from LOCAL" })
vim.keymap.set("n", "<leader>gr", ":diffget //3<CR>", { desc = "Get from REMOTE" })




-- binding to start debug 
function _G.debug_custom_file()
  local args = vim.fn.input("Enter arguments: ")
  args = vim.split(args, ",")
  require('dap').run({
    type = "python",
    request = "launch",
    program = vim.fn.expand('%'),
    args = args
  })
end

vim.api.nvim_set_keymap('n', '<leader>ds', ":lua debug_custom_file()<CR>", { noremap = true, silent = true })


