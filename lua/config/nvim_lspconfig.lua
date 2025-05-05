

function setup_elixirls(lspconfig) 
	lspconfig.elixirls.setup({
		cmd = { "elixir-ls" },
		settings = {
			elixirLS = {
				dialyzerEnabled = true, 
				fetchDeps = false
			}
		}
	})
end 

function setup_pyright(lspconfig)
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
end 


function setup_clangd(lspconfig)
	lspconfig.clangd.setup({
	  cmd = { "clangd" }, -- Ensure 'clangd' is in your PATH or provide its full path
	  filetypes = { "c", "cpp", "objc", "objcpp" },
	  on_attach = function(client, bufnr)
		-- Enable LSP keybindings and features here (optional)
		local opts = { noremap = true, silent = true }
		local buf_set_keymap = vim.api.nvim_buf_set_keymap

		buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
		buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
		buf_set_keymap(bufnr, 'n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
	  end,
	  capabilities = require('cmp_nvim_lsp').default_capabilities() -- Optional: Add nvim-cmp support
	})
end 

return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")
		setup_elixirls(lspconfig)
		setup_pyright(lspconfig)
		-- setup_clangd(lspconfig)
	end,
}

